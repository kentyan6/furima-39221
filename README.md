# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| last_name          | string              | null: false               |
| family_kana        | string              | null: false               |
| last_kana          | string              | null: false               |
| birthday           | date                | null: false               |

### Association

* has_many :items
* has_many :buys

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| goods_name                          | string     | null: false                    |
| content                             | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| condition_id                        | integer    | null: false                    |
| delivery_price_id                   | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| delivery_date_id                    | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :buyer_information

## buyer_informations table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| area             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy

