# アプリケーション名
「 World Trip 」

# アプリケーション概要
このアプリケーションは、海外旅行が趣味で他とは違う旅行を体験したい方と語学力を活かして収益を上げたいと思っている方をターゲットとしたサービスです。  
現地に住む一般の方がガイドやツアーを行うことで、一人一人違った体験をすることができると考え開発しました。  

# URL
http://35.72.62.202/

# テスト用アカウント
**投稿者用**
* メールアドレス: test2@test.com
* パスワード: 123def

**申込者用**
* メールアドレス: test1@test.com
* パスワード: 123abc

**申込用カード情報**
* 番号：4242424242424242
* 期限：登録時より未来
* セキュリティコード：123

# 利用方法
* ユーザー登録すると、ツアーを投稿することができます。また、別のユーザーが投稿したツアーに申し込むことができます。
* ユーザーがユーザーに対して評価することができ、評価点と内容を確認することができます。
* ユーザー登録すると、ユーザーは旅行の情報や日記などを投稿することができます。

# 目指した課題解決
* ツアー会社で行っているサービスだとスケジュール通りに動かなければならないため、ゆっくり楽しみたい方などには向いていないという課題  
* ネット上にある情報だけでは限られた体験しかできないという課題
* 自分の語学力を活かして収益を上げたいが活かす場所がないという課題
* ネット上で出会った一般の方にガイドを頼むことに不安があるという課題  

# 洗い出した要件
* ユーザー登録機能
* ツイート投稿機能
* ツアー投稿機能
* ユーザー評価機能
* 申し込み機能
* ツアー検索機能
* ページネーション機能

# 実装した機能についての画像やGIFおよびその説明
・ユーザーが出来事などを投稿できる機能  
https://gyazo.com/c00830cf08b5e1b10c9022338397f42b  
・ユーザーがツアーを投稿できる機能  
https://gyazo.com/a137ee3035cfed101cb6b71d5c74f77f  
・ユーザーがツアー申し込むことができる機能  
https://gyazo.com/dce2f433c0b4034eea3c3b98dea1b3d1  
・ユーザーがユーザーを評価する機能  
https://gyazo.com/84b4d34e04affa7174de99da5c043043  
・ページネーション機能  
https://gyazo.com/6d763c60ce825e9196e201349d412e96  

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
- has_many :tours
- has_many :purchases

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

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

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

## tours テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| start_on    | date       | null: false                    |
| end_on      | date       | null: false                    |
| country     | integer    | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| tour   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tour
- has_one    :information

## information テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| phone_number | integer    | null: false                    |
| other        | string     |                                |
| purchase     | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
