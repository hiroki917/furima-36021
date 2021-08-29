FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1abcde' }
    password_confirmation { password }
    first_name            { '小柳津' }
    last_name             { '洋毅' }
    first_name_kana       { 'オヤイヅ' }
    last_name_kana        { 'ヒロキ' }
    birth_day             { '1986-09-17' }
  end
end
