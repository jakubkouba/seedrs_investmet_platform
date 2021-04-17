FactoryBot.define do
  factory :campaign do
    sequence :name do |n|
      "Campaign_#{n}"
    end
    image { 'http://path/to/image' }
    target_amount { 10_000 }
    sector { 'retail' }
    country { 'United Kingdom' }
    investment_multiple { 100 }
  end
end
