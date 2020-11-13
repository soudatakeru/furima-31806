FactoryBot.define do
  factory :item do
    association :user
    name   {"山田"}
    explanation {"あああ"}
    price {"500"}
    category_id {2}
    condition_id {2}
    handling_id {2}
    postage_id {2}
    prefecture_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
