FactoryBot.define do
  factory :order_address do
    zipcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    tel_number { '0354111212' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
