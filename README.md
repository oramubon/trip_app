# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string |             |
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday           | date   | null: false |
| gender             | string | null: false |

### Association
- has_many :tweets
- has_many :comments
- has_one  :area
- has_one  :image


## areas テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| country  | integer    | null: false                    |
| state    | string     | null: false                    |
| language | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to  :user

## images テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to  :user

## tweets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to  :user
- has_many    :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| tweet  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to  :user
- belongs_to  :tweet
