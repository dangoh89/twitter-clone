FactoryBot.define do
  factory :user do
    username 'username'
    password 'password'
    sequence :email { |n| "adam#{n}@example.com" }
  end

  factory :twit do
    association :user, factory: :user
    message 'some message'
  end

  factory :tag do
    association :twit, factory: :twit
    message_tag 'hashtag'
  end
end
