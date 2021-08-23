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
|  area          | Integer      |null: false                      |  
|  status        | Integer      |null: false                      |  
|  day           | Integer      |null: false                      |  
|  explanation   | text         |null: false                      |  
|  shipping      | Integer      |null: false                      |  
|  category      | Integer      |null: false                      |  
|  price         | integer      |null: false                      |  
|  ActiveHash_id | integer      |null: false                      |  
|  user          | references   |null: false, foreign_key: true   | 
| prefecture     | text         |null: false                      |  

###   Association

- belongs_to :user
- has_one :purchases

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
| block            | text         |                                 |  
|"expiration_data" | date         |null: false                      |  
| security code    | integer      |null: false                      |  
| postal code      | string       |null: false                      |  
| prefectures      | string       |null: false                      |  
| municipalities   | string       |null: false                      |  
|"telephone_number"| string      |null: false                      |  
| purchase         | references   |null: false, foreign_key: true   | 
| ActiveHash_id    | integer      |null: false                      |  


###   Association
- belongs_to :purchase

<!-- ## items_imagesテーブル

| Column         | Type          | Option       |
|----------------|-------------  |--------------|
|    image       | ActiveStorage |null: false   |  
|    item_id     | refereces    |null: false, foreign_key: true   |


###   Association
- belongs_to :item -->