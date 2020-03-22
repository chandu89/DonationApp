FactoryGirl.define do
  factory :bio do
    Bio     { Faker::Lorem.sentence }
    user { FactoryGirl.build(:user)}
  end
end
