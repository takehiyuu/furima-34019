# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ----------- |
| nickname                   | string | null: false |
| email                      | string | null: false |
| encrypted_password         | string | null: false |
| last_name                  | string | null: false |
| first_name                 | string | null: false |
| last_name_kana             | string | null: false |
| first_name_kana            | string | null: false |
| birth_date                 | string | nill: false |

### Association

- has_many :users_items
- belongs_to :oder

## items テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| name                | string    | null: false                    |
| info                | string    | null: false                    |
| category            | string    | null: false                    |
| sales_status        | string    | null: false                    |
| shipping_fee_status | string    | null: false                    |
| prefecture          | string    | null: false                    |
| scheduled_delivery  | string    | null: false                    |
| price               | string    | null: false                    |
| image               | active_storage                             |

### Association

- has_many :users_items
- has_many :item(active_hash)

## items(active_hash)テーブル

| Column                 | Type    | Options                        |
| ---------------------- | ------- | ------------------------------ |
| category_id            | integer | null: false, foreign_key: true |
| sales_status_id        | integer | null: false, foreign_key: true |
| shipping_fee_status_id | integer | null: false, foreign_key: true |
| prefecture_id          | integer | null: false, foreign_key: true |
| scheduled_delivery_id  | integer | null: false, foreign_key: true |

## Association
- belongs_to :item

## users_items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| card_number    | string | null: false |
| card_exp_month | string | null: false |
| card_exp_year  | string | null: false |
| card_cvc       | string | null: false |
| postal_code    | string | null: false |
| prefecture     | string | null: false |
| city           | string | null: false |
| addresses      | string | null: false |
| building       | string | null: false |
| phone-number   | string | null: false |

### Association

- belongs_to :item
- belongs_to :user