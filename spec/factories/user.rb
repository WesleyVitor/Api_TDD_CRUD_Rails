#Define a model User new

FactoryBot.define do
    factory :user do
        nickname {FFaker::Lorem.word}
        level {FFaker::Random.rand(1..99)}
        kind {%w[knight wizard].sample}
    end
end