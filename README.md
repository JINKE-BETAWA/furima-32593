# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ---------------    | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kane_first_name    | string | null: false |
| kane_last_name     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases


## items テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| cost_id     | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- has_one    :purchase
- belongs_to :user


## purchases テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key:true  |
| item              | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :sips_address


## sips_address テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| area_id         | integer    | null: false                    |
| city            | string     | null: false                    |
| street_number   | string     | null: false                    |
| building_number | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase