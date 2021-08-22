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
| birth_day         | data          |  null: false                 |
###   Association
- has_many :items
- has_many :purchases

 





## itemsテーブル

| Column         | Type         | Option                          |
|----------------|------------- |---------------------------------|
|  name          | string       |null: false                      |  
|  area          | text         |null: false                      |  
|  status        | string       |null: false                      |  
|  days          | string       |null: false                      |  
|  explanation    | text        |null: false                      |  
|  shipping      | text         |null: false                      |  
|  category      | string       |null: false                      |  
|  price         | integer      |null: false                      |  



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

| Column          | Type         | Option                          |
|---------------- |------------- |---------------------------------|
| block           | text         |                                 |  
| card            | integer      |null: false                      |  
| expiration_data | data         |null: false                      |  
| security code   | integer      |null: false                      |  
| postal code     | text         |null: false                      |  
| prefectures     | text         |null: false                      |  
| municipalities  | text         |null: false                      |  
| prefectures     | text         |null: false                      |  
| telephone number| integer      |null: false                      |  
| purchase        | references   |null: false, foreign_key: true   | 


###   Association
- belongs_to :purchase

<!-- ## items_imagesテーブル

| Column         | Type          | Option       |
|----------------|-------------  |--------------|
|    image       | ActiveStorage |null: false   |  
|    item_id     | refereces    |null: false, foreign_key: true   |


###   Association
- belongs_to :item -->