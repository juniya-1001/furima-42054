class Address < ApplicationRecord
  belong_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :zipcode, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: '' }

  validates :city,       presence: true
  validates :street,     presence: true
  validates :tel_number, presence: true, format: { with: /\A\d{10,11}\z/, message: '' }
end
