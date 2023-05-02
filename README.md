# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false               |
| password           | string              | null: false               |
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
| good_name                           | integer    | null: false                    |
| content                             | text       | null: false                    |
| category                            | text       | null: false                    |
| condition                           | text       | null: false                    |
| delivery_price                      | text       | null: false                    |
| prefecture_id                       | text       | null: false                    |
| delivery_date                       | text       | null: false                    |
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
- has_one :buyer information

## buyer informations table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefecture_id    | string     | null: false                    |
| area             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | nil                            |
| telephone_number | string     | null: false                    |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy

