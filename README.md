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
- has_one  :area
- has_one  :image
- has_many :reviewer_reviews, class_name: 'Review', :foreign_key => 'reviewer_id'
- has_many :reviewee_reviews, class_name: 'Review', :foreign_key => 'reviewee_id'

## areas テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| country  | integer    | null: false                    |
| state    | string     | null: false                    |
| language | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## images テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## tweets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## reviews テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| score       | integer    | null: false                    |
| content     | text       |                                |
| reviewer_id | references | null: false, foreign_key: true |
| reviewee_id | references | null: false, foreign_key: true |

### Association
- belongs_to :reviewer, :class_name => 'User', :foreign_key => 'reviewer_id'
- belongs_to :reviewee, :class_name => 'User', :foreign_key => 'reviewee_id'

