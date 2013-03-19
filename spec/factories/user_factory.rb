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

  factory :user do |f|
    first_name "Test"
    last_name  "User"
    password { generate(:password) }
    email { generate(:email) }
    username { generate(:username) }
    is_admin false
  end

  factory :admin, :class => User do
    first_name 'Kandan'
    last_name 'Admin'
    password { generate(:password) }
    email { generate(:email) }
    username { generate(:username) }
    is_admin true
  end
end
