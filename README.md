# NutritionLens  
**EN / 日本語対応 README**

---

# 🇺🇸 **English**

## Overview
**NutritionLens** is an iOS application that allows users to scan product barcodes and instantly view nutritional information.  
Built with SwiftUI and a clean MVVM architecture, the app emphasizes **stability, localization, and predictable user flows**.

---

## Features

### **Barcode Scanner**
- User‑controlled open/close toggle  
- Auto‑close after successful scan  
- Reset button for clean scan cycles  

### **Localization**
- Full support for Base (English‑ready) and Japanese  
- All UI strings managed through `Localizable.strings`  

### **Architecture**
- Clean MVVM structure  
- Clear separation between domain models, DTOs, and UI  
- Removed unused layers for maintainability  

### **Product Search**
- Fetches product data from OpenFoodFacts  
- Graceful error handling with localized messages  

---

## Tech Stack
- **Language:** Swift 5.9  
- **UI:** SwiftUI, NavigationStack  
- **Architecture:** MVVM  
- **Networking:** URLSession (OpenFoodFacts API)  
- **Localization:** `Localizable.strings` (Base / Japanese)  
- **Async:** async/await  
- **Images:** SwiftUI Image  
- **Error Handling:** Result + localized errors  

---

## Architecture Notes
- **MVVM Separation:** Views focus on UI, ViewModels handle logic and state  
- **Scanner Lifecycle:** Toggle control, auto‑close on success, reset for predictable cycles  
- **Localization:** All UI text centralized in `Localizable.strings`  
- **API Layer:** DTO → Domain mapping, structured error handling  
- **Cleanup:** Removed unused folders and files for a clean project structure  
- **Predictable UX:** Scan → Result → Reset → Rescan flow designed for clarity  

---

## Requirements
- iOS 17+  
- Xcode 15+  
- Swift 5.9+  

---

## Project Structure
```
NutritionLens/
 ├── Models/
 ├── ViewModels/
 ├── Views/
 ├── Services/
 ├── Resources/
 │    ├── Base.lproj/Localizable.strings
 │    └── ja.lproj/Localizable.strings
 └── NutritionLensApp.swift
```
---

## Screenshots (Portfolio‑Ready Descriptions)
<img width="414" height="896" alt="NutritionLensSearchBarcodeScreen" src="https://github.com/user-attachments/assets/1cf24f45-930b-47a7-b352-e6075eb862dc" />
<img width="414" height="896" alt="NutritionLensBarcodeScanScreen" src="https://github.com/user-attachments/assets/0593f023-7b48-4a7c-a788-189c95115759" />
<img width="414" height="896" alt="NutritionLensSearchResultScreen" src="https://github.com/user-attachments/assets/164a565e-7b87-453d-adb4-6ec3a2584f6b" />
<img width="414" height="896" alt="NutritionLens_SearchScreen" src="https://github.com/user-attachments/assets/daa534c7-e0b0-47a6-a755-af61df1eab8f" />


### **Home / Scanner Screen**
Shows the barcode scanner with a clean, minimal UI.  
Users can open/close the scanner manually and reset the scan cycle at any time.

### **Scan Result Screen**
Displays product name, nutritional values, and localized messages.  
If the product is unknown, a friendly localized error message is shown.

### **Localization Demo**
Side‑by‑side comparison of English and Japanese UI, demonstrating full i18n support.

---

## License
MIT License

---

## Developer
**Patrician Andres**

---

# 🇯🇵 **日本語**

## 概要
**NutritionLens** は、商品バーコードをスキャンして栄養情報を即座に表示できる iOS アプリです。  
SwiftUI とクリーンな MVVM アーキテクチャを採用し、**安定性・ローカライズ・予測可能なユーザーフロー**を重視しています。

---

## 機能

### **バーコードスキャナー**
- ユーザー操作によるスキャナーの開閉トグル  
- スキャン成功後の自動クローズ  
- クリーンなスキャンサイクルを実現するリセットボタン  

### **ローカライズ**
- Base（英語準備済み）＋日本語に完全対応  
- すべての UI テキストを `Localizable.strings` で一元管理  

### **アーキテクチャ**
- クリーンな MVVM 構造  
- ドメインモデル、DTO、UI の明確な分離  
- 未使用レイヤーを削除し、保守性を向上  

### **商品検索**
- OpenFoodFacts API から商品データを取得  
- ローカライズされたエラーメッセージによる丁寧なエラーハンドリング  

---

## 技術スタック
- **言語:** Swift 5.9  
- **UI:** SwiftUI, NavigationStack  
- **アーキテクチャ:** MVVM  
- **ネットワーク:** URLSession（OpenFoodFacts API）  
- **ローカライズ:** `Localizable.strings`（Base / 日本語）  
- **非同期処理:** async/await  
- **画像表示:** SwiftUI Image  
- **エラーハンドリング:** Result + localized errors  

---

## アーキテクチャと設計のポイント
- **MVVM の徹底:** View とロジックを明確に分離し、保守性を向上  
- **スキャナーのライフサイクル管理:** 開閉トグル、成功後の自動クローズ、リセットによる安定したスキャンサイクル  
- **ローカライズ対応:** すべての UI テキストを `Localizable.strings` に統合  
- **API レイヤーの整理:** DTO 変換、エラーハンドリングを明確に分離  
- **不要コードの削除:** 未使用フォルダ・ファイルを整理し、プロジェクト構造をシンプルに  
- **予測可能な UX:** スキャン → 結果表示 → リセット → 再スキャン の流れを一貫して設計  

---

## 動作環境
- iOS 17 以上  
- Xcode 15 以上  
- Swift 5.9 以上  

---

## プロジェクト構成
```
NutritionLens/
 ├── Models/
 ├── ViewModels/
 ├── Views/
 ├── Services/
 ├── Resources/
 │    ├── Base.lproj/Localizable.strings
 │    └── ja.lproj/Localizable.strings
 └── NutritionLensApp.swift
```

---

## スクリーンショット（ポートフォリオ向け説明）
<img width="414" height="896" alt="NutritionLensSearchBarcodeScreen" src="https://github.com/user-attachments/assets/1cf24f45-930b-47a7-b352-e6075eb862dc" />
<img width="414" height="896" alt="NutritionLensBarcodeScanScreen" src="https://github.com/user-attachments/assets/0593f023-7b48-4a7c-a788-189c95115759" />
<img width="414" height="896" alt="NutritionLensSearchResultScreen" src="https://github.com/user-attachments/assets/164a565e-7b87-453d-adb4-6ec3a2584f6b" />
<img width="414" height="896" alt="NutritionLens_SearchScreen" src="https://github.com/user-attachments/assets/daa534c7-e0b0-47a6-a755-af61df1eab8f" />


### **ホーム / スキャナー画面**
シンプルで見やすい UI にスキャナーを配置。  
ユーザーが自由に開閉でき、いつでもリセット可能。

### **スキャン結果画面**
商品名や栄養情報を表示。  
商品が見つからない場合は、ローカライズされた丁寧なエラーメッセージを表示。

### **ローカライズデモ**
英語版と日本語版の UI を比較し、完全な i18n 対応をアピール。

---

## ライセンス
MIT License

---

## 開発者
**アンドレス　パトリシアン

---
