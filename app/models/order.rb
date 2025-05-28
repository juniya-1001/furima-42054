class Order < ApplicationRecord
  belong_to :user
  belong_to :item
  has_one   :address
  # validates :token, presence: true
end
