FactoryGirl.define do
  sequence :file_name do |n|
    "file#{n}.jpg"
  end

  factory :attachment do
    file { generate(:file_name) }
    user
    channel
  end
end
