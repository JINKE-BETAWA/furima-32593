FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    first_name {person.first.kanji}
    last_name {person.last.kanji}
    kane_first_name {person.first.katakana}
    kane_last_name {person.last.katakana}
    birthday {Faker::Date.backward}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end