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
- has_many :purchases

## items テーブル
| Column               | Type       | Options           |
| -------------------- | ---------- | ------------------|
| item name            | string     | null: false       |
| price                | string     | null: false       |
| explain              | text       | null: false       |
| category_id          | integer    | null: false       |
| condition_id         | integer    | null: false       |
| delivery cost_id     | integer    | null: false       |
| prefecture_id        | integer    | null: false       |
| delivery how long_id | integer    | null: false       |
| user                 | references | foreign_key: true |

### Association
- belongs_to :user
- has_one：purchases

## purchases テーブル
| Column  | Type       | Options           |
| ------- | ---------- | ------------------|    
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one：shipping_addresses

## shipping address テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post          | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       | 
| block number  | string     | null: false       |
| building      | string     | null: false       |
| phone number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association
- belongs_to :purchases