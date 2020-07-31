## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|fist_kana|string|null: false|
|last_kana|string|null: false|
|date|date|null: false|


### Association
- has_many :items
- has_many :item_purchases
- has_many :comments


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|images|text|null: false|
|name|string|null: false|
|info|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|price|integer|null: false|



### Association
- belongs_to :user
- belongs_to :comment
- has_many :item_purchases
- belongs_to :address


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false| foreign_key: true|
|body|text|null: false|

### Association
- has_many :items
- belongs_to :user

## item_purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|items_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :items
- belongs_to :user

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|string|null: false|


### Association
- has_many :items

