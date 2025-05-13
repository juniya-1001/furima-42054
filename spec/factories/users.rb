FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { 'a1' + Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    kana_last_name        { %w[ヤマダ サトウ タカハシ イノウエ カワムラ].sample }
    kana_first_name       { %w[タロウ シュン トシ ハナ カエデ].sample  }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
