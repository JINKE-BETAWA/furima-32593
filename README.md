# テーブル設計

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| mail_address    | string | null: false |
| password        | string | null: false |
| re_password     | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| kane_first_name | string | null: false |
| kane_last_name  | string | null: false |
| birthyear       | date   | null: false |
| birthmonth      | date   | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items
- has_many :purchases


## items テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       |            |                                |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| state       | string     | null: false                    |
| cost        | integer    | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- has_one    :purchases
- belongs_to :user


## purchases テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| creditcard_number | integer    | null: false                    |
| creditcard_year   | integer    | null: false                    |
| creditcard_month  | integer    | null: false                    |
| creditcard_code   | integer    | null: false                    |
| user              | references | null: false, foreign_key:true  |
| item              | references | null: false, foreign_key:true  |
| sips_address      | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :sips_address


## sips_address テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| street_number   | string     | null: false                    |
| building_number | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase