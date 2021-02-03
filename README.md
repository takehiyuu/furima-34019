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

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last-name        | string | null: false |
| first-name       | string | null: false |
| last-name-kana   | string | null: false |
| first-name-kana  | string | null: false |

### Association

- has_many :users_items
- belongs_to :oder

## items テーブル

| Column                   | Type      | Options                        |
| ------------------------ | --------- | ------------------------------ |
| item-name                | string    | null: false                    |
| item-info                | string    | null: false                    |
| item-category            | string    | null: false                    |
| item-sales-status        | string    | null: false                    |
| item-shipping-fee-status | string    | null: false                    |
| item-prefecture          | string    | null: false                    |
| item-scheduled-delivery  | string    | null: false                    |
| item-price               | string    | null: false                    |
| image                    | active_storage                             |

### Association

- has_many :users_items

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
| card-number    | string | null: false |
| card-exp-month | string | null: false |
| card-exp-year  | string | null: false |
| card-cvc       | string | null: false |
| postal-code    | string | null: false |
| prefecture     | string | null: false |
| city           | string | null: false |
| addresses      | string | null: false |
| building       | string | null: false |
| phone-number   | string | null: false |

### Association

- belongs_to :item
- belongs_to :user