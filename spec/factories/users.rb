FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'take11' }
    password_confirmation { password }
    last_name             { '信野' }
    first_name            { '岳宏' }
    last_name_kana        { 'シンノ' }
    first_name_kana       { 'タケヒロ' }
    birth_date            { '1990-10-23' }
  end
end
