FactoryBot.define do
  factory :item do
    name                      { '小物' }
    explanation               { 'テストです' }
    category_id               { 2 }
    status_id                 { 2 }
    shipping_charge_id        { 2 }
    area_id                   { 2 }
    day_id                    { 2 }
    price                     { 1000 }
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
