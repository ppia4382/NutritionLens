# Nutrition Lens 基本設計書

## 1. 文書情報

- 文書名: Nutrition Lens 基本設計書
- バージョン: 1.0.0
- 作成日: 2025-12-27
- 作成者: Patrician Philamer Ilada Andres

---

## 2. システム構成概要

### 2.1 全体構成

本システムは iOS アプリ単体で構成されるクライアントアプリケーションであり、外部サービスとして Open Food Facts API を利用する。

- クライアント: iOS アプリ（Swift / SwiftUI）
- 外部 API: Open Food Facts（REST / JSON）
- データ永続化: iOS ローカル（UserDefaults 等）

### 2.2 アーキテクチャ方針

- プレゼンテーション層: SwiftUI + ViewModel（MVVM）
- ドメイン層: UseCase / Entity
- データ層: Repository / API クライアント / DTO

---

## 3. 画面設計（概要）

### 3.1 画面一覧

1. G-01: バーコード検索画面（メイン画面）
2. G-02: 商品詳細画面
3. G-03: お気に入り一覧画面（MVP）

### 3.2 画面遷移

- 起動 → G-01 バーコード検索画面
- G-01 から:
  - 手入力 + 検索 → G-02 商品詳細画面（同一 NavigationStack 内）
  - バーコードスキャン → スキャン結果取得後 G-02 へ
  - お気に入りボタン → G-03 お気に入り一覧画面

---

## 4. 機能構成

### 4.1 モジュール構成

- `App`
  - `NutritionLensApp`: エントリポイント
- `Presentation`
  - `Screens`
    - `ProductLookup`
      - `ProductLookupView`
      - `ProductLookupViewModel`
    - `Favorites`
      - `FavoritesView`
      - `FavoritesViewModel`
  - `Components`
    - `BarcodeScannerView`（カメララッパ）
- `Domain`
  - `Entities`
    - `Product`
    - `Nutriments`
  - `UseCases`
    - `FetchProductUseCase`
    - `ToggleFavoriteUseCase`
    - `GetFavoritesUseCase`
- `Data`
  - `API`
    - `OpenFoodFactsAPI`
  - `Repositories`
    - `ProductRepository`（プロトコル）
    - `ProductRepositoryImpl`
    - `FavoritesRepository`（プロトコル）
    - `FavoritesRepositoryImpl`
  - `DTO`
    - `OFFProductResponse`
    - `OFFProductDTO`
    - `OFFNutrimentsDTO`
- `Resources`
  - `Localizable.strings`
  - `Assets.xcassets`

---

## 5. データフロー（概要）

### 5.1 バーコード検索の流れ（手入力）

1. ユーザーが `ProductLookupView` にバーコードを入力し、「検索」ボタン押下。
2. `ProductLookupViewModel.search()` を呼び出し。
3. `FetchProductUseCase` を経由して `ProductRepository` を呼び出し。
4. `ProductRepositoryImpl` が `OpenFoodFactsAPI` を利用して API 呼び出し。
5. API レスポンス（DTO）をドメインモデル `Product` に変換。
6. `Product` を ViewModel に返却。
7. ViewModel が `@Published` の `product` を更新。
8. View が再描画され、商品情報が表示される。

### 5.2 バーコードスキャンの流れ

1. `ProductLookupView` から `BarcodeScannerView` をモーダル表示。
2. `BarcodeScannerView` がバーコードを検出。
3. 検出したバーコードをクロージャ等で `ProductLookupView` に通知。
4. ViewModel の `barcode` を更新し、`search()` を自動実行。

---

## 6. エラーハンドリング方針

- API レスポンス `status != 1` または `product` が存在しない場合:
  - ドメイン層で `ProductNotFoundError` として扱う。
  - ViewModel で「商品が見つかりませんでした。」を表示。
- 通信タイムアウト・ネットワークエラー:
  - 共通エラーとして扱い、「通信エラーが発生しました。」を表示。
- JSON パースエラー:
  - ログ出力の上、ユーザーには一般的なエラーメッセージを表示。

---

## 7. ローカライズ方針

- 表示テキストは `Localizable.strings` で管理。
- キー名は英語、値に日本語を設定。
- 将来的な英語対応を見据え、Text には直接日本語を書かず `NSLocalizedString` を利用。

例:

```swift
Text(NSLocalizedString("product_info_section_title", comment: ""))
