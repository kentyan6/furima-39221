# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| name_kana          | string              | null: false               |
| birthday           | text                | null: false               |

### Association

* has_many :items
* has_many :buys

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| image                               | text       | null: false                    |
| goods_name                          | string     | null: false                    |
| content                             | text       | null: false                    |
| category                            | text       | null: false                    |
| condition                           | text       | null: false                    |
| delivery_price                      | text       | null: false                    |
| delivery_area                       | text       | null: false                    |
| delivery_date                       | text       | null: false                    |
| price                               | string     | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| card_number     | string     | null: false                    |
| limit_date      | string     | null: false                    |
| security_code   | string     | null: false                    |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :buyer information

## buyer informations table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| area             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | nil                            |
| telephone_number | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy

