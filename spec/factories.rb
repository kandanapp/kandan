Factory.sequence :ido_id do |n|
  "abc-#{ n }"
end

Factory.sequence :email do |n|
  "email#{ n }@factory.com"
end

Factory.define :channel do |f|
  f.name "Test channel"
end

Factory.define :user do |f|
  f.first_name "Test"
  f.last_name  "User"
  f.email  { Factory.next(:email) }
  f.ido_id { Factory.next(:ido_id) }
end
