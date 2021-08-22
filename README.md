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

| Column            | Type          | Option        |
|------------------ |-------------- |-------------- |
| nickname          | string        | null: false   |  
| encrypted_password| string        | null: false   |  
| emil              | string        | null: false   |  
| first_name        | string        | null: false   |  
| last_name         | string        | null: false   |  
| first_name_kana   | string        |null: false    |
| last_name_kana    | string        |null: false    |
| birth_day         | string        |null: false    |
###   Association
- has_many :tests

 





## itemsテーブル

| Column         | Type         | Option                          |
|----------------|------------- |---------------------------------|
|  item_name     | string       |null: false                      |  
|  area          | text         |null: false                      |  
|  status        | string       |null: false                      |  
|  days          | string       |null: false                      |  
|  image_id      | refereces    |null: false, foreign_key: true   |  
|  explantion    | text         |null: false                      |  
|  shipping      | text         |null: false                      |  
|  Category      | string       |null: false                      |  
|  price         | integer      |null: false                      |  



###   Association

## Purchase テーブル

| Column         | Type        | Option       |
|----------------|-------------|--------------|
|  user_id       | refereces    |null: false, foreign_key: true   | 
|  shipping_id   | refereces    |null: false, foreign_key: true   | 
|  item_id       | refereces    |null: false, foreign_key: true   | 


###   Association


## Shipping information

| Column         | Type        | Option                          |
|----------------|-------------|---------------------------------|
| adress         | text        |null: false                      |  
| Purchase_if    |refereces    |null: false, foreign_key: true   | 


###   Association


## items_imageテーブル

| Column         | Type          | Option       |
|----------------|-------------  |--------------|
|    image       | ActiveStorage |null: false   |  
|                |string         |null: false   |  
|                |string         |null: false   |  
|                |string         |null: false   |  
|                |string         |null: false   |  


###   Association