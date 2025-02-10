FactoryBot.define do
  factory :todo do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
    completed { false }
  end
end
