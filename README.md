# テーブル設計

## users テーブル

| Column            | Type          | Option                       |
|------------------ |-------------- |--------------                |
| nickname          | string        |  null: false                 |  
| encrypted_password| string        |  null: false                 |  
| email             | string        |  null: false, unique: true   |  
| first_name        | string        |  null: false                 |  
| last_name         | string        |  null: false                 |  
| first_name_kana   | string        |  null: false                 |
| last_name_kana    | string        |  null: false                 |
| birth_day         | date          |  null: false                 |
###   Association
- has_many :items
- has_many :purchases

 





## itemsテーブル

| Column         | Type         | Option                          |
|----------------|------------- |---------------------------------|
|  name          | string       |null: false                      |  
|  area_id       | integer      |null: false                      |  
|  status_id     | integer      |null: false                      |  
|  day_id        | integer      |null: false                      |  
|  explanation   | text         |null: false                      |  
|  shipping_id   | integer      |null: false                      |  
|  category_id   | integer      |null: false                      |  
|  price         | integer      |null: false                      |  
|  delivery      | integer      |null: false                      |  
|  user          | references   |null: false, foreign_key: true   |   

###   Association

- belongs_to :user
- has_one :purchase

## Purchases テーブル

| Column         | Type          | Option       |
|----------------|-------------  |--------------|
|  user          | references    |null: false, foreign_key: true   | 
|  item          | references    |null: false, foreign_key: true   | 


###   Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping address

## Shippingsテーブル

| Column           | Type         | Option                          |
|----------------  |------------- |---------------------------------|
| address          | text         |null: false                      |  
| telephone_number | string       |null: false                      |  
| building_name    | string       |null: false                      |  
| purchase         | references   |null: false, foreign_key: true   |    
| area_id          | integer      |null: false                      |  
| postal_code      | integer      |null: false                      |  
| municipalities   | string       |null: false                      |  

 

###   Association
- belongs_to :purchase

<!-- ## items_imagesテーブル

| Column         | Type          | Option       |
|----------------|-------------  |--------------|
|    image       | ActiveStorage |null: false   |  
|    item_id     | refereces    |null: false, foreign_key: true   |


###   Association
- belongs_to :item -->