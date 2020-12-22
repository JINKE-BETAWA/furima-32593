FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    kane_first_name {}
    kane_last_name {}
    birthday {Faker::Date.backward}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end