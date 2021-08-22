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
| birth_day         | integer       |null: false    |
###   Association
- has_many :items, through: :Purchase
- has_many :Purchases

 





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

- has_many :users, through: :Purchase
- has_many :Purchases

## Purchases テーブル

| Column         | Type        | Option       |
|----------------|-------------|--------------|
|  user_id       | refereces    |null: false, foreign_key: true   | 
|  shipping_id   | refereces    |null: false, foreign_key: true   | 
|  item_id       | refereces    |null: false, foreign_key: true   | 


###   Association
- belongs_to :user
- belongs_to :item
- has_one : Purchase

## Shippingsテーブル

| Column         | Type        | Option                          |
|----------------|-------------|---------------------------------|
| adress         | text        |null: false                      |  
| Purchase_id    |refereces    |null: false, foreign_key: true   | 


###   Association
- belongs_to :Purchase

## items_imagesテーブル

| Column         | Type          | Option       |
|----------------|-------------  |--------------|
|    image       | ActiveStorage |null: false   |  
|    item_id     | refereces    |null: false, foreign_key: true   |


###   Association
- belongs_to :item