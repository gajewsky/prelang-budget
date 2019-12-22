require 'faker'

User.transaction do
  users = User.create!(
    [
      {
        email: 'admin@example.com',
        password: 'password',
        password_confirmation: 'password'
      },
      {
        email: 'second@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    ]
  )

  Category.create!(
    [
      { title: 'Food', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'House', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Transport', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Telecommunication', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Healthcare', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Cloth', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Hygiene', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Trips', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Entertainment', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Other expenses', description: Faker::Hipster.sentence, kind: 0 },
      { title: 'Incomes', description: Faker::Hipster.sentence, kind: 1 }
    ]
  )

  subcategories = Subcategory.create!(
    [
      { title: 'House', description: Faker::Hipster.sentence, category_id: 1 },
      { title: 'City', description: Faker::Hipster.sentence, category_id: 1 },
      { title: 'Job', description: Faker::Hipster.sentence, category_id: 1 },
      { title: 'Alcohol', description: Faker::Hipster.sentence, category_id: 1 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 1 },
      { title: 'Rent', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Electricity', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Gas', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Heating', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Means', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Equipment', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Pet', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Fuel', description: Faker::Hipster.sentence, category_id: 3 },
      { title: 'Ticket', description: Faker::Hipster.sentence, category_id: 3 },
      { title: 'Taxi', description: Faker::Hipster.sentence, category_id: 3 },
      { title: 'Public transport', description: Faker::Hipster.sentence, category_id: 3 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 2 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 3 },
      { title: 'Phone', description: Faker::Hipster.sentence, category_id: 4 },
      { title: 'Music', description: Faker::Hipster.sentence, category_id: 4 },
      { title: 'Internet', description: Faker::Hipster.sentence, category_id: 4 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 4 },
      { title: 'Doctor', description: Faker::Hipster.sentence, category_id: 5 },
      { title: 'Research', description: Faker::Hipster.sentence, category_id: 5 },
      { title: 'Medicine', description: Faker::Hipster.sentence, category_id: 5 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 5 },
      { title: 'Cloth', description: Faker::Hipster.sentence, category_id: 6 },
      { title: 'Boots', description: Faker::Hipster.sentence, category_id: 6 },
      { title: 'Accessories', description: Faker::Hipster.sentence, category_id: 6 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 6 },
      { title: 'Makeup', description: Faker::Hipster.sentence, category_id: 7 },
      { title: 'Services', description: Faker::Hipster.sentence, category_id: 7 },
      { title: 'Hygienic', description: Faker::Hipster.sentence, category_id: 7 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 7 },
      { title: 'Transport', description: Faker::Hipster.sentence, category_id: 8 },
      { title: 'Cultural', description: Faker::Hipster.sentence, category_id: 8 },
      { title: 'Equipment', description: Faker::Hipster.sentence, category_id: 8 },
      { title: 'Souvenirs', description: Faker::Hipster.sentence, category_id: 8 },
      { title: 'Food', description: Faker::Hipster.sentence, category_id: 8 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 8 },
      { title: 'Sport', description: Faker::Hipster.sentence, category_id: 9 },
      { title: 'Cinema', description: Faker::Hipster.sentence, category_id: 9 },
      { title: 'Concerts', description: Faker::Hipster.sentence, category_id: 9 },
      { title: 'Books', description: Faker::Hipster.sentence, category_id: 9 },
      { title: 'Hobby', description: Faker::Hipster.sentence, category_id: 9 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 9 },
      { title: 'Charity', description: Faker::Hipster.sentence, category_id: 10 },
      { title: 'Gifts', description: Faker::Hipster.sentence, category_id: 10 },
      { title: 'RTV Equipment', description: Faker::Hipster.sentence, category_id: 10 },
      { title: 'Education', description: Faker::Hipster.sentence, category_id: 10 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 10 },
      { title: 'Salary', description: Faker::Hipster.sentence, category_id: 11 },
      { title: 'Other', description: Faker::Hipster.sentence, category_id: 11 },
      { title: 'Accommodation', description: Faker::Hipster.sentence, category_id: 8 }
    ]
  )

  Contractor.create!( [
      { name: Faker::Hipster.word, description: Faker::Hipster.sentence, subcategory_id: subcategories.sample.id },
      { name: Faker::Hipster.word, description: Faker::Hipster.sentence, subcategory_id: subcategories.sample.id },
      { name: Faker::Hipster.word, description: Faker::Hipster.sentence, subcategory_id: subcategories.sample.id },
      { name: Faker::Hipster.word, description: Faker::Hipster.sentence, subcategory_id: subcategories.sample.id },
      { name: Faker::Hipster.word, description: Faker::Hipster.sentence, subcategory_id: subcategories.sample.id },
      { name: Faker::Hipster.word, description: Faker::Hipster.sentence, subcategory_id: subcategories.sample.id },
      { name: Faker::Hipster.word, description: Faker::Hipster.sentence, subcategory_id: subcategories.sample.id },
    ]
  )

  ActsAsTaggableOn::Tag.create(
    [
      { name: Faker::Hipster.word, taggings_count: 1 },
      { name: Faker::Hipster.word, taggings_count: 1 },
      { name: Faker::Hipster.word, taggings_count: 4 },
      { name: Faker::Hipster.word, taggings_count: 3 },
      { name: Faker::Hipster.word, taggings_count: 2 },
      { name: Faker::Hipster.word, taggings_count: 2 },
      { name: Faker::Hipster.word, taggings_count: 3 },
      { name: Faker::Hipster.word, taggings_count: 2 },
      { name: Faker::Hipster.word, taggings_count: 13 },
      { name: Faker::Hipster.word, taggings_count: 4 },
      { name: Faker::Hipster.word, taggings_count: 2 },
      { name: Faker::Hipster.word, taggings_count: 10 }
    ]
  )
  12.times do |n|
    Income.create!(
      [
        {
          value: Faker::Number.decimal(l_digits: 4, r_digits: 2),
          operation_date: n.months.ago,
          subcategory_id: 52,
          description: Faker::Hipster.sentence,
          user_id: 1
        },
        {
          value: Faker::Number.decimal(l_digits: 4, r_digits: 2),
          operation_date: n.months.ago,
          subcategory_id: 52,
          description: Faker::Hipster.sentence,
          user_id: 2
        }
      ]
    )
  end

  500.times do
    expense = Expense.create!(
      operation_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      description: Faker::Hipster.sentence,
      value: Faker::Number.decimal(l_digits: 2, r_digits: 2),
      subcategory_id: subcategories.pluck(:id).sample,
      user_id: users.pluck(:id).sample,
      to_divide: [true, false].sample
    )

    Bill.create!(
      operation_date: expense.operation_date,
      user_id: users.pluck(:id).sample,
      contractor_id: 14,
      to_divide: true,
      expenses: [expense]
    )
  end
end
