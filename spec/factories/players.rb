# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    email { Faker::Internet.email }

    username { Faker::Internet.username(specifier: 5..8) }

    password { Faker::Internet.password(min_length: 10, max_length: 20) }

    guest { false }

    trait :guest do |p|
      p.guest { true }
    end
  end
end
