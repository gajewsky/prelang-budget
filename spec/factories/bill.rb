FactoryBot.define do
  factory :bill do
    user
    contractor
    to_divide { true }
    operation_date { '2019-01-01' }
    expenses { create_list :expense, 1 }
  end
end
