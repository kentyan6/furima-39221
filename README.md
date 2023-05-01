# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| encrypted_name     | string              | null: false               |
| birthday           | pulldown            | null: false               |

### Association

* has_many :items
* has_many :buys

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| image                               | string     | null: false                    |
| title                               | string     | null: false                    |
| catch_copy                          | text       | null: false                    |
| concept                             | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## buys table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| prototype   | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user

## buy information table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| prototype   | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user