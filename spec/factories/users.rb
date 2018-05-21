FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { "hcas87878y8ac" }
        password_confirmation { "hcas87878y8ac" }
    end
end