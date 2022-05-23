FactoryBot.define do
  factory :tag do
    name { %w[Rails ActiveStorage JavaScript CSS Ruby].sample }
  end
end
