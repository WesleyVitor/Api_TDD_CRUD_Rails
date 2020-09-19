FactoryBot.define do
  factory :weapon do
    nome {FFaker::Lorem.word}
    description {FFaker::Lorem.paragraph}
    power_base {FFaker::Random.rand(1..3000)}
    power_step {FFaker::Random.rand(100..300)}
    level {1}
    
  end
end
