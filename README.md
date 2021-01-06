# テーブル設計

## users テーブル

| Column           | Type                 | Options     |
| ---------------- | -------------------- | ----------- |
| nickname         | string               | null: false |
| email            | string               | null: false |
| password         | encrypted_password   | null: false |
| last_name_kanji  | string               | null: false |
| first_name_kanji | string               | null: false |
| last_name_kana   | string               | null: false |
| first_name_kana  | string               | null: false |
| birthday         | date                 | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | text       | null: false                    |
| product_information    | text       | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| sell_price             | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_info

## shipping_info テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | integer    | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

- belongs_to :purchase