---
layout: policy
title: 檔案匣隱私政策
app: folder
app_name: 檔案匣 / FileNook
lang: zh-Hant
permalink: /zh-Hant/app/folder/privacy/
translation_group: folder-privacy
sections: folder_policy_sections
updated: "2026-09-19"
policy_version: "1.3"
description: 檔案匣如何處理本機檔案、使用分析、廣告與購買。
---
<div class="summary-box" markdown="1">
**簡要說明**：檔案內容主要在裝置上處理，不會自動上傳至開發者的檔案伺服器。3.0.0 正式版預設向 Firebase 傳送使用分析與當機報告；免費版顯示 Google 廣告。專業版移除廣告，但不關閉分析與診斷。
</div>

## 1. 適用範圍 {#scope}

本政策適用於 Vanto 團隊的**檔案匣**（FileNook，舊名「資料夾 / Folder」，App Store ID **1563518405**），不適用於本站其他 App。以下 3.0.0 的說明依據目前實作；你安裝的版本可能不同。

## 2. 本機檔案與存取 {#local}

匯入的檔案、掃描與轉換結果、閱讀進度、收藏、垃圾桶、設定及必要的檔案狀態儲存在裝置上。App 沒有由開發者經營的檔案同步帳號，也不會自動上傳檔案內容、照片、影音、OCR 結果或密碼。裝置備份是否包含 App 資料，取決於系統設定。

相機、照片、系統檔案、生物辨識及區域網路，僅在你使用相關功能時存取。App 鎖用於限制進入 App，並非逐一加密檔案；你可以自行建立加密備份並妥善保管密碼。

## 3. 傳輸與分享 {#transfer}

啟用「從電腦傳檔案」後，同一區域網路中知道網址的裝置，可透過**未加密的 HTTP** 上傳；若啟用下載，該裝置還可存取所選範圍內的檔案。請只在可信任的網路使用，完成後關閉。檔案不會經由開發者伺服器轉送。

你主動分享、匯出或用其他 App 開啟檔案時，選定內容會交給接收方；其副本和處理方式依該服務規定。刪除 App 內原件不會刪除外部副本。

## 4. 分析、廣告與購買 {#services}

3.0.0 正式版預設啟用 Firebase Analytics，並在下次啟動時傳送符合條件的 Crashlytics 當機報告，以了解功能使用情況並排查故障。自訂事件只記錄固定的操作類別、結果、耗時及數量／容量級距，**不傳送檔案內容、檔名、路徑、搜尋詞、辨識文字、字幕或密碼**。Firebase SDK 仍可能處理 App 執行個體識別碼、裝置與系統資訊及自動工作階段資料；App 不設定使用者 ID，也沒有 App 內分析關閉開關。參見 [Firebase 隱私說明](https://firebase.google.com/support/privacy)。

免費版使用 Google Mobile Ads（橫幅及獎勵廣告）。廣告 SDK 可能處理 IP 位址、裝置或廣告識別碼、廣告互動及診斷資訊。適用地區先由 Google UMP 處理廣告同意，系統 ATT 追蹤權限另行請求；拒絕追蹤不代表不顯示廣告。確認專業版權益後不再載入廣告，但分析與診斷仍依上文運作。參見 [Google 隱私權政策](https://policies.google.com/privacy)及 [Mobile Ads 資料揭露](https://developers.google.com/admob/ios/privacy/data-disclosure)。

專業版的一次性購買與復原購買由 Apple StoreKit 處理；開發者不會收到信用卡資料。參見 [Apple 隱私權政策](https://www.apple.com/legal/privacy/)。

## 5. 舊版本差異 {#legacy}

舊版可能提供 Google Drive、媒體投放及月費／年費訂閱，授權、廣告與 Firebase 啟動方式也可能不同。使用 Google Drive 時，你選擇的資料會交給 Google。上述 3.0.0 行為不適用於所有舊版；請以安裝版本及其權限提示為準。

## 6. 保存與選擇 {#retention}

本機資料通常保留至你刪除內容或 App 資料；啟用垃圾桶時，可在 App 內還原已刪除項目。手動備份、系統備份、已分享副本、廣告／Firebase 資料及 Apple 交易紀錄，須分別在相應位置管理；解除安裝 App 不一定會清除這些副本。

你可以管理系統權限、廣告同意、分享及區域網路傳輸；目前沒有 App 內分析關閉開關。對於僅儲存在你裝置上的檔案，開發者無法代為讀取或刪除。其他資料的存取、刪除或撤回請求，可依適用法律聯絡我們；第三方資料的保存期限依其政策而定。

## 7. 聯絡與更新 {#contact}

服務與隱私聯絡窗口：Vanto 團隊 · [{{ site.contact_email }}](mailto:{{ site.contact_email }})。請註明 App 版本，不要寄送密碼或私人檔案。來信僅用於處理請求及必要的後續聯絡。資料處理如有重大變更，我們會更新本頁，並依適用要求另行通知或取得同意。
