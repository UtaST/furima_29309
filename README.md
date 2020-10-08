# テーブル設計

## users テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |

### Association

- has_many :items
- has_many :purchases
- has_many :sns_credentials
- has_many :comments
- has_one :card
- has_one :profile

## sns_credentials テーブル

| Column   | Type       | Options                          |
| -------- | ---------- | -------------------------------- |
| provider | string     | null: false                      |
| uid      | string     | null: false                      |
| user     | references | foreign_key: true, optional: true|

### Association

- belongs_to :user

## profiles テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birthday         | date       | null: false                    |
| user             | references | optional: true                 |

### Association

- belongs_to :user

## cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| token            | string     | null: false                    |
| customer_token   | string     | null: false                    |
| user             | references | null: false, foreign_key: true | 

### Association

- belongs_to :user

## comments テーブル

| Colu | Type       | Options                        |
| ---- | ---------- | ------------------------------ |
| text | text       | null: false                    |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| image                  | string     | null: false                    |
| name                   | string     | null: false                    |
| explanation            | string     | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_charge_id     | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :item_tag_relations
- has_many :tags, through :item_tag_relations
- has_many :comments
- has_one :purchase

## item_tag_relations テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :tags

## tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tag_name   | string     | null: false                    |

### Association

- has_many :item_tag_relations
- has_many :items, through :item_tag_relations

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| tell_number   | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

![](https://i.gyazo.com/64d9eb9823b46a29d562ffd207225055.png "")
