FactoryBot.define do
  factory :user_purchase do
    user_id { '15' }
    item_id { '10' }
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '362-0806' }
    city { 'あ' }
    phone_number { '123456789' }
    address { '1' }
    prefecture_id { 2 }
  end
end
