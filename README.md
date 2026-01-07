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

## Engineering Qualities: Testability, Scalability, Extensibility
NutritionLens was designed with long‑term maintainability and engineering quality in mind. The architecture emphasizes clear separation of concerns, predictable data flow, and modular components that can evolve without breaking existing functionality.

### **Testability**
- ViewModels isolate business logic from UI, making them easy to unit test  
- API access and mapping are separated into dedicated services  
- Localized error handling allows deterministic test scenarios  
- Pure Swift models (structs) simplify validation and decoding tests  

### **Scalability**
- MVVM structure supports adding new screens without impacting existing ones  
- API layer is modular and can be expanded to support additional endpoints  
- Localization system scales naturally to more languages  
- Scanner flow is isolated, allowing future enhancements (e.g., multi‑scan mode)  

### **Extensibility**
- Clear folder structure (Models / ViewModels / Views / Services) supports future features  
- Product model and nutriments model are designed to accept new fields  
- Architecture allows adding features like Favorites, History, or Offline Mode  
- UI components (e.g., scanner view) are reusable and replaceable  

---

## **Human Interface Guidelines (HIG) Compliance**

NutritionLens follows Apple’s Human Interface Guidelines to ensure a familiar, intuitive, and consistent user experience across iOS devices.

### **Key Areas of Compliance**
- **Clarity:** Minimal UI, clear hierarchy, and focused content  
- **Consistency:** Uses native SwiftUI components, system colors, and SF Symbols  
- **Feedback:** Scanner provides immediate visual state changes  
- **User Control:** Users can open/close the scanner and reset the flow at any time  
- **Localization:** Full support for Base and Japanese, following Apple’s internationalization guidelines  

## **How NutritionLens Follows Apple’s HIG**

NutritionLens was intentionally designed to feel native to iOS. The app aligns with Apple’s Human Interface Guidelines in the following ways:

- Uses standard navigation patterns (NavigationStack)  
- Employs system fonts, spacing, and layout conventions  
- Keeps the interface minimal and content‑focused  
- Provides predictable flows (Scan → Result → Reset)  
- Uses localized strings instead of hardcoded text  
- Ensures UI components behave consistently with iOS expectations  

This results in an app that feels familiar, intuitive, and aligned with Apple’s design philosophy.

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

## **設計品質：Testability / Scalability / Extensibility**

NutritionLens は、長期的な保守性と品質を重視して設計されています。責務分離、予測可能なデータフロー、モジュール化された構造により、将来的な機能追加にも柔軟に対応できます。

### **Testability（テスト容易性）**
- ViewModel にロジックを集約し、UI から切り離すことで単体テストが容易  
- API アクセスとデータ変換を専用サービスに分離  
- ローカライズされたエラーにより、テストケースが明確  
- 純粋な Swift モデル（struct）によりデコードや検証が簡単  

### **Scalability（スケーラビリティ）**
- MVVM により画面追加が既存機能に影響しない  
- API レイヤーはエンドポイント追加に柔軟  
- ローカライズは多言語対応に自然に拡張可能  
- スキャナー機能は独立しており、将来的な強化が容易  

### **Extensibility（拡張性）**
- 明確なフォルダ構成により機能追加が容易  
- Product / Nutriments モデルはフィールド追加に対応  
- お気に入り機能や履歴機能などの追加が容易  
- スキャナー UI は再利用可能で差し替えも簡単  

---

## **Human Interface Guidelines (HIG) 準拠**

NutritionLens は、iOS アプリとして自然で直感的な操作性を提供するため、Apple の Human Interface Guidelines に沿って設計されています。

### **準拠している主なポイント**
- **明確性（Clarity）:** シンプルな UI と明確な情報階層  
- **一貫性（Consistency）:** SwiftUI の標準コンポーネントやシステムカラーを使用  
- **フィードバック（Feedback）:** スキャナー状態の即時反映  
- **ユーザー操作性（User Control）:** スキャナーの開閉やリセットをユーザーが自由に操作可能  
- **ローカライズ（Localization）:** Base + 日本語対応、Apple の国際化ガイドラインに準拠  

## **NutritionLens が HIG に沿って設計されている理由**

NutritionLens は、iOS ネイティブアプリとして自然に感じられるよう、Apple の HIG に基づいて設計されています。

- NavigationStack による標準的なナビゲーション  
- システムフォント・標準スペーシング・標準レイアウトの採用  
- コンテンツを中心としたミニマルな UI  
- 予測可能なユーザーフロー（スキャン → 結果 → リセット）  
- ハードコードを避け、すべての文言をローカライズ  
- iOS 標準の操作感に沿ったコンポーネント設計  

---

## ライセンス
MIT License

---

## 開発者
**アンドレス　パトリシアン

---
