# テーブル設計

## users テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| last_name_kanji  | text     | null: false |
| first_name_kanji | text     | null: false |
| last_name_kana   | text     | null: false |
| first_name_kana  | text     | null: false |
| birthday         | datetime | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               |            | null: false |
| title               | text       | null: false |
| category            |            | null: false |
| sales_status        |            | null: false |
| shipping_fee_status |            | null: false |
| prefecture          |            | null: false |
| scheduled_delivery  |            | null: false |
| sell_price          | integer    | null: false |
| user                | references |             |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | integer    | null: false |
| expiration_date |            | null: false |
| card_cvc        |            | null: false |
| postal_code     |            | null: false |
| prefecture      |            | null: false |
| city            |            | null: false |
| addresse        | text       | null: false |
| building        | text       | null: false |
| phone_number    | integer    | null: false |
| user            | references |             |
| item            | references |             |

### Association

- belongs_to :item
- belongs_to :user
