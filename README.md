# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options     |
| ------------------  | ------     | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| category_id         | integer    | null: false |
| state_id            | integer    | null: false |
| shipping_charge_id  | integer    | null: false |
| shipping_area_id    | integer    | null: false |
| shipping_time_id    | integer    | null: false |
| price               | integer    | null: false |
| user                | references | null: false, foreign_key: true |

### Association


- has_one :order
- belongs_to :user
- belongs_to :category
- belongs_to :state
- belongs_to :shipping_charge
- belongs_to :shipping_area
- belongs_to :shipping_time



## addresses テーブル

| Column              | Type       | Options     |
| ------------------  | ------     | ----------- |
| zipcode             | string     | null: false |
| prefecture_id        | integer    | null: false |
| city                | string     | null: false |
| street              | string     | null: false |
| building            | string     |             |
| tel_number          | string     | null: false |
| order               | references | null: false, foreign_key: true |

### Association
- belong_to :order

## orders テーブル

| Column    | Type       | Options     |
| ----------| -----------| ------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association
- belong_to :user
- belong_to :item
- has_one   :address


## comments テーブル

| Column    | Type       | Options     |
| ----------| -----------| ------------|
| content   | text       | null: false |
| user_name | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item