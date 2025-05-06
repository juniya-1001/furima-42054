# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name      　　　     | string | null: false |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_one :orders
- has_many :comments

## items テーブル

| Column              | Type       | Options     |
| ------------------  | ------     | ----------- |
| image               |            | null: false |
| name                | string     | null: false |
| description         | text       | null: false |
| category_id         | integer    | null: false, foreign_key: true |
| state_id        | integer    | null: false, foreign_key: true |
| shipping_charge_id  | integer    | null: false, foreign_key: true |
| shipping_area_id    | integer    | null: false, foreign_key: true |
| shipping_day_id     | integer    | null: false, foreign_key: true |
| price               | integer    | null: false |

### Association

- has_many :comments
- has_one :order
- has_one :credit
- has_one :address
- belongs_to :user
- belongs_to :category
- belongs_to :state
- belongs_to :shipping_charge
- belongs_to :shipping_area
- belongs_to :shipping_day


## credits テーブル

| Column              | Type       | Options     |
| ------------------  | ------     | ----------- |
| encrypted_cord_num  | integer    | null: false |
| encrypted_ex_date   | string     | null: false |
| encrypted_cvc       | integer    | null: false |

### Association

- has_one :item

## addresses テーブル

| Column              | Type       | Options     |
| ------------------  | ------     | ----------- |
| zipcode             | string     | null: false |
| perfecter_id        | string     | null: false |
| city                | string     | null: false |
| street              | string     | null: false |
| building            | string     |             |
| tel_number          | integer    | null: false |

### Association
- has_one :item

## orders モデル

| Column    | Type       | Options     |
| ----------| -----------| ------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association
- has_one :user
- has_one :item

## comments テーブル

| Column    | Type       | Options     |
| ----------| -----------| ------------|
| content   | text       | null: false |
| user_name | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item