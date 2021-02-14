FactoryBot.define do
  factory :order_street_address do
        token          { 'samlpe1111' }
        postal_code    { '596-0005' }
        prefecture_id  { 2 }
        city           { '岸和田市' }
        addresses      { '春木11' }
        phone_number   { '09011111111' }


  end
end
