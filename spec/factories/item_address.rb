FactoryBot.define do
  factory :item_address do
    postal_code { '123-4567' }
    area_id { 2 }
    municipalities { '東京都' }
    house_number { '1-1' }
    buildeing_name { '東京ハイツ' }
    telephone_number { '09055551234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end