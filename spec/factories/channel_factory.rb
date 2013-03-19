FactoryGirl.define do
  factory :primary_channel, :class => Channel do
    id 1
    name 'Lobby'
    user
  end

  sequence :channel_name do |n|
    "Channel #{n}"
  end

  factory :channel do
    name { generate(:channel_name) }
    user
  end
end
