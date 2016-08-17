json.extract! expense, :id, :spent_date, :description, :value, :subcategory_id, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)