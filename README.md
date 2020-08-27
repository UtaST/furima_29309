# テーブル設計

## users テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birthday         | date       | null: false                    |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| explanation         | string     | null: false                    |
| category            | integer    | null: false                    |
| condition           | integer    | null: false                    |
| shipping_charge     | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| days_until_shipping | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     |                                |
| building_name | string     |                                |
| tell_number   | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase