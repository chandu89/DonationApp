FactoryGirl.define do
  factory :bio do
    Bio     { Faker::Lorem.sentence }
    user { FactoryGirl.create(:user)}
  end
end
