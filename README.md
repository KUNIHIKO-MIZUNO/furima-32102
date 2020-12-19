# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |


### Association
- has_many :items
- has_many :orders

## items テーブル
| Column               | Type       | Options           |
| -------------------- | ---------- | ------------------|
| item_name            | string     | null: false       |
| price                | string     | null: false       |
| explain              | text       | null: false       |
| category_id          | integer    | null: false       |
| condition_id         | integer    | null: false       |
| delivery_cost_id     | integer    | null: false       |
| prefecture_id        | integer    | null: false       |
| delivery_how_long_id | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association
- belongs_to :user
- has_one ：order

## orders テーブル
| Column  | Type       | Options           |
| ------- | ---------- | ------------------|    
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one：address

## addresses テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       | 
| house_number  | string     | null: false       |
| building_name | string     | null: false       |
| phone_number  | string     | null: false       |
| order         | references | foreign_key: true |

### Association
- belongs_to :order