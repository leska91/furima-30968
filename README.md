# テーブル設計

## users テーブル

| Column             | Type                 | Options                  |
| ------------------ | -------------------- | ------------------------ |
| nickname           | string               | null: false              |
| email              | string               | null: false, unique:true |
| encrypted_password | srting               | null: false              |
| last_name_kanji    | string               | null: false              |
| first_name_kanji   | string               | null: false              |
| last_name_kana     | string               | null: false              |
| first_name_kana    | string               | null: false              |
| birthday           | date                 | null: false              |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string       | null: false                    |
| information            | text       | null: false                    |
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

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_info

## shipping_infos テーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

- belongs_to :purchase