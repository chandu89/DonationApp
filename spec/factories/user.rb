FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}

    trait :with_bios do
      bios { FactoryGirl.create_list(:bio, 4)}
    end
  end
end
