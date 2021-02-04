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
| birth_date                 | date   | nill: false |

### Association

- has_many :items
- belongs_to :order

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | string     | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :user

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one :item
- has_one :user
- belongs_to :street_address

## street_addresses テーブル

| Column        | Type       | Options                         |
| postal_code   | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| city          | string     | null: false                     |
| addresses     | string     | null: false                     |
| building      | string     |                                 |
| phone_number  | string     | null: false                     |
| order         | references | null: false, foreign_key: true  |

### Association

- has_one :order
