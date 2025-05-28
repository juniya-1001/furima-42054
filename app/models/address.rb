class Address < ApplicationRecord
  belong_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
