FactoryBot.define do
  factory :bill do
    association :user
    association :contractor
    to_divide { true }
    operation_date { '2019-01-01' }

    trait :with_expense do
      expenses { create_list :expense, 1 }
    end
  end
end
