FactoryBot.define do
  factory :item do
    name                 { Faker::Commerce.product_name }
    description          { Faker::Lorem.paragraph }
    category_id          { Faker::Number.between(from: 2, to: 10) } # ActiveHashは1が未選択
    state_id             { Faker::Number.between(from: 2, to: 6) }
    shipping_charge_id   { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id     { Faker::Number.between(from: 2, to: 48) }
    shipping_time_id     { Faker::Number.between(from: 2, to: 4) }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.image.png'), filename: 'test_image.png')
    end
  end
end
