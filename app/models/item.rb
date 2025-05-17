class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_area
  belongs_to :Shipping_charge
  belongs_to :shipping_time

  validates :image, presence: { message: "can't be blank" }
  validates :name, presence: { message: "can't be blank" }
  validates :description, presence: { message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1 , message: "must be other than 1"}
  validates :state_id, numericality: { other_than: 1 , message: "must be other than 1"}
  validates :shipping_area_id, numericality: { other_than: 1 , message: "must be other than 1"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "must be other than 1"}
  validates :shipping_time_id, numericality: { other_than: 1 , message: "must be other than 1"}
  validates :price, presence:, numericality: { only_integer: true, message: "is not a number"}
  validates :price, numericality: { greater_than_or_equal_to: 300, message: "must be greater than or equal to 300" }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: "must be less than or equal to 9999999" }
end
