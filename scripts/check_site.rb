#!/usr/bin/env ruby
require 'bundler/setup'
require 'nokogiri'
require 'yaml'
require 'uri'

root = File.expand_path('..', __dir__)
output = File.join(root, '_site')
config = YAML.load_file(File.join(root, '_config.yml'))
origin = config.fetch('url')
prefix = config.fetch('baseurl')
contact_email = config.fetch('contact_email')
abort 'Unexpected support email' unless contact_email == 'support@vanto.space'
abort 'Unexpected public origin' unless origin == 'https://apps.vanto.space' && prefix.empty?
abort 'CNAME differs from public origin' unless File.read(File.join(root, 'CNAME')).strip == URI(origin).host
abort 'Published CNAME missing' unless File.read(File.join(output, 'CNAME')).strip == URI(origin).host
expected = %w[index.html zh/index.html en/privacy/index.html zh/privacy/index.html
  en/app/calculator/privacy/index.html zh/app/calculator/privacy/index.html
  en/app/folder/index.html zh/app/folder/index.html
  en/app/folder/privacy/index.html zh/app/folder/privacy/index.html
  en/app/shengye/privacy/index.html zh/app/shengye/privacy/index.html
  ja/app/shengye/privacy/index.html ko/app/shengye/privacy/index.html es/app/shengye/privacy/index.html
  en/app/folder/terms/index.html zh/app/folder/terms/index.html en/site-privacy/index.html
  zh/site-privacy/index.html 404.html]
expected.each { |path| abort "Missing page: #{path}" unless File.file?(File.join(output, path)) }
%w[en/terms zh/terms en/media-guide zh/media-guide].each do |path|
  abort "Removed page still published: #{path}" if File.exist?(File.join(output, path))
end

documents = {}
Dir.glob(File.join(output, '**', '*.html')).each do |file|
  next if File.basename(file).start_with?('google')
  html = File.read(file)
  abort "Removed content: #{file}" if html.match?(/googletagmanager|Welcome to GitHub Pages/i)
  abort "Unrendered template: #{file}" if html.include?('{%') || html.include?('{{')
  abort "Unresolved policy decision: #{file}" if html.include?('DIAGNOSTICS_DECISION_PENDING')
  doc = Nokogiri::HTML(html)
  abort "Retired identity or contact: #{file}" if html.match?(/Mac\s+Zhou|独立开发者|independent\s+developer|death7074/i)
  emails = html.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i).uniq
  abort "Unexpected email: #{file}" unless emails == [contact_email]
  abort "Missing team identity: #{file}" unless doc.at_css('.site-footer strong')&.text&.include?('Vanto')
  abort "Old host or base path: #{file}" if html.include?('kumamon7074.github.io') || html.include?('/app.github.io/')
  canonical = doc.at_css('link[rel="canonical"]')&.[]('href')
  abort "Wrong canonical: #{file}" unless canonical&.start_with?(origin + '/')
  abort "Missing page structure: #{file}" unless doc.at_css('html[lang]') && doc.css('h1').length == 1 && doc.at_css('main#content')
  abort "Tracking/runtime script: #{file}" unless doc.css('script').empty?
  ids = doc.css('[id]').map { |node| node['id'] }
  abort "Duplicate IDs: #{file}" unless ids.uniq == ids
  documents[file] = doc
end

documents.each do |file, doc|
  doc.css('a[href], link[href], img[src]').each do |node|
    value = node['href'] || node['src']
    if value.start_with?('mailto:')
      abort "Wrong email link: #{file}" unless URI.parse(value).opaque.split('?', 2).first == contact_email
      next
    end
    if value.start_with?('https://', 'http://')
      next unless URI(value).host == URI(origin).host
      abort "Insecure owned link: #{value}" unless value.start_with?(origin + '/')
      value = value.delete_prefix(origin)
    end
    uri = URI.parse(value)
    if uri.path.nil? || uri.path.empty?
      destination = file
    else
      abort "Base path missing: #{value} in #{file}" unless uri.path.start_with?(prefix + '/')
      relative = uri.path.delete_prefix(prefix + '/')
      destination = File.join(output, relative)
      destination = File.join(destination, 'index.html') if uri.path.end_with?('/')
    end
    abort "Broken local link: #{value} in #{file}" unless File.file?(destination)
    if uri.fragment && documents[destination]
      abort "Missing anchor: #{value} in #{file}" unless documents[destination].css('[id]').any? { |n| n['id'] == uri.fragment }
    end
  end
end

sitemap = File.read(File.join(output, 'sitemap.xml'))
abort 'Sitemap uses old origin' if sitemap.include?('kumamon7074.github.io') || sitemap.include?('/app.github.io/')
abort 'Sitemap misses custom origin' unless sitemap.include?(origin + '/')

sections = YAML.load_file(File.join(root, '_data/policy_sections.yml')).map { |section| section.fetch('id') }
%w[en zh].each do |language|
  doc = documents.fetch(File.join(output, language, 'app/calculator/privacy/index.html'))
  sections.each { |id| abort "Policy section missing: #{language}/#{id}" unless doc.at_css("article ##{id}") }
  abort "Wrong app identity" unless doc.text.include?('1322880549')
  other = language == 'en' ? 'zh' : 'en'
  expected_translation = "#{prefix}/#{other}/app/calculator/privacy/"
  abort "Language switch leaves app" unless doc.at_css('a.language-link')['href'] == expected_translation
  legacy = documents.fetch(File.join(output, language, 'privacy/index.html'))
  abort "Legacy policy differs" unless legacy.at_css('article.prose').text.strip == doc.at_css('article.prose').text.strip
end
{ 'privacy' => 'folder_policy_sections', 'terms' => 'folder_terms_sections' }.each do |kind, section_file|
  folder_sections = YAML.load_file(File.join(root, "_data/#{section_file}.yml")).map { |section| section.fetch('id') }
  %w[en zh].each do |language|
    doc = documents.fetch(File.join(output, language, "app/folder/#{kind}/index.html"))
    folder_sections.each { |id| abort "Folder #{kind} section missing: #{language}/#{id}" unless doc.at_css("article ##{id}") }
    abort 'Wrong Folder identity' unless doc.text.include?('1563518405')
    other = language == 'en' ? 'zh' : 'en'
    abort 'Folder language switch leaves document' unless doc.at_css('a.language-link')['href'] == "/#{other}/app/folder/#{kind}/"
  end
end
translations = YAML.load_file(File.join(root, '_data/translations.yml')).fetch('shengye-privacy')
abort 'Incomplete Shengye translations' unless translations.map { |entry| entry.fetch('lang') }.sort == %w[en es ja ko zh]
policy_metadata = []
translations.each do |translation|
  language = translation.fetch('lang')
  doc = documents.fetch(File.join(output, language, 'app/shengye/privacy/index.html'))
  abort 'Wrong Shengye document language' unless doc.at_css('html')['lang'] == language
  abort 'Wrong Shengye canonical' unless doc.at_css('link[rel="canonical"]')['href'] == origin + translation.fetch('url')
  YAML.load_file(File.join(root, '_data/shengye_policy_sections.yml')).each do |section|
    abort "Shengye section missing: #{section['id']}" unless doc.at_css("article ##{section['id']}")
    abort "Untranslated section: #{language}/#{section['id']}" if section.fetch(language).strip.empty?
    doc.css('.policy-toc, .mobile-toc').each do |toc|
      link = toc.at_css("a[href='##{section['id']}']")
      abort 'Wrong translated contents label' unless link&.text == section.fetch(language)
    end
  end
  abort 'Wrong Shengye identity' unless doc.text.include?('1241562587') && doc.text.include?('com.mac.zhou.artrecorder.first')
  current = doc.css('.language-picker a[aria-current="page"]')
  abort 'Missing current language' unless current.length == 1 && current.first['lang'] == language
  abort 'Wrong language option count' unless doc.css('.language-option').length == translations.length
  translations.each do |entry|
    link = doc.at_css(".language-option[lang='#{entry['lang']}']")
    alternate = doc.at_css("link[rel='alternate'][hreflang='#{entry['lang']}']")
    abort 'Shengye language switch leaves app' unless link&.[]('href') == entry.fetch('url') && link.text == entry.fetch('label')
    abort 'Missing reciprocal hreflang' unless alternate&.[]('href') == origin + entry.fetch('url')
    abort 'Translation missing from sitemap' unless sitemap.include?(origin + entry.fetch('url'))
  end
  policy_metadata << doc.css('.policy-meta dd').map(&:text)
  %w[CloudKit .shengye AdMob UMP ATT StoreKit Firebase Analytics Crashlytics Performance].each do |term|
    abort "Missing Shengye disclosure: #{language}/#{term}" unless doc.at_css('article').text.include?(term)
  end
end
abort 'Shengye translations have different dates or versions' unless policy_metadata.uniq.length == 1 && policy_metadata.first == ['2026-09-18', '1.3']
puts "Site checks passed: #{documents.length} pages, unified identity/email, five-language policies, internal links/anchors, reciprocal hreflang, policy reuse and no scripts."
