# テーブル設計

## users テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| kana       | string | null: false |
| nickname   | string | null: false |
| birthday   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column            | Type       | Options           |
| ----------        | ---------- | ------------------|
| name              | string     | null: false       |
| price             | string     | null: false       |
| explain           | text       | null: false       |
| category          | text       | null: false       |
| condition         | text       | null: false       |
| delivery cost     | text       | null: false       |
| delivery area     | text       | null: false       |
| delivery how long | text       | null: false       |
| comment           | text       | null: false       |
| user              | references | foreign_key: true |

### Association
- belongs_to :user
- has_one：purchases
- has_one：shipping address

## purchases テーブル
| Column  | Type       | Options           |
| ------- | ---------- | ------------------|    
| when    | string     | null: false       |
| what    | string     | null: false       |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items

## shipping address テーブル
| Column       | Type       | Options           |
| -------      | ---------- | ----------------- |
| post         | string     | null: false       |
| prefecture   | string     | null: false       |
| municipality | string     | null: false       | 
| block number | string     | null: false       |
| phone number | string     | null: false       |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items