FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :password do |n|
    "#{rand(11111111...99999999)}"
  end

  sequence :username do |n|
    "user#{n}"
  end

  factory :channel do |f|
    f.name "Test channel"
  end

  factory :user do |f|
    f.first_name "Test"
    f.last_name  "User"
    f.password { FactoryGirl.generate(:password)}
    f.email  { FactoryGirl.generate(:email) }
    f.username { FactoryGirl.generate(:username) }
  end
end