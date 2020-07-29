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
|birthday|integer|null: false|


### Association
- has_many :items


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|images|string|null: false, foreign_key: true|
|items_name|string|null: false, foreign_key: true|
|info|text|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :comment


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|body|text|null: false|

### Association
- has_many :items

## transactionテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|items_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :items
- belongs_to :address

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|post_card|integer|null: false, foreign_key: true|
|prefectures|string|null: false, foreign_key: true|
|city|string|null: false, foreign_key: true|
|address|string|null: false, foreign_key: true|
|building_name|string|null: false, foreign_key: true|
|phone_number|integer|null: false, foreign_key: true|


### Association
- has_many :transaction

