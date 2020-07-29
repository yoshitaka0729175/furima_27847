## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|


### Association
- has_many :comments, through: :users_comments
- has_many :items
- has_many :users_comments


## users_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|comment_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :comment

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|image|string|null: false, foreign_key: true|
|product name|string|null: false, foreign_key: true|
|explanation|text|null: false, foreign_key: true|
|price|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :comment

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|null: false, foreign_key: true|

### Association
- has_many :users, through: :users_comments
- has_many :items
- has_many :users_comments