FactoryBot.define do
    factory :user do
        username {|n| Faker::Internet.username}
        password {'password'}
    end
end