FactoryBot.define do
  factory :expense do
    subcategory
    operation_date { '2019-01-01' }
    description { 'Description' }
    value { 343.23 }
    to_divide { true }
  end
end
