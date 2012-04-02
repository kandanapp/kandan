FactoryGirl.define do
  sequence :ido_id do |n|
    "abc-#{n}"
  end

  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :channel do |f|
    f.name "Test channel"
  end

  factory :user do |f|
    f.first_name "Test"
    f.last_name  "User"
    f.email  { Factory.next(:email) }
    f.ido_id { Factory.next(:ido_id) }
  end
end