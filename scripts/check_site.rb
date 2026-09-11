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
abort 'Unexpected public origin' unless origin == 'https://apps.vanto.space' && prefix.empty?
abort 'CNAME differs from public origin' unless File.read(File.join(root, 'CNAME')).strip == URI(origin).host
abort 'Published CNAME missing' unless File.read(File.join(output, 'CNAME')).strip == URI(origin).host
expected = %w[index.html zh/index.html en/privacy/index.html zh/privacy/index.html
  en/app/calculator/privacy/index.html zh/app/calculator/privacy/index.html
  en/app/folder/index.html zh/app/folder/index.html en/site-privacy/index.html
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
  doc = Nokogiri::HTML(html)
  abort "Removed product content: #{file}" if doc.text.match?(/\bvanto\b/i)
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
    next if value.start_with?('mailto:')
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
puts "Site checks passed: #{documents.length} pages, internal links/anchors, translations, policy reuse, removed pages and no scripts."
