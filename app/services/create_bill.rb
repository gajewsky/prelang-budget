class CreateBill
  extend ServiceObject

  def initialize(attrs:, expenses_attrs:, user:)
    @attrs = attrs
    @expenses_attrs = expenses_attrs
    @user = user
  end

  def call
    Bill.create!(attrs_with_expenses)
  end

  private

  attr_reader :attrs, :expenses_attrs, :user

  def expenses
    @expenses ||= Array(expenses_attrs).map { |attrs| create_expense(attrs) }
  end

  def create_expense(expense_attrs)
    attributes = expense_attrs.merge(
      operation_date: operation_date,
      user_id: user_id,
      contractor_id: attrs[:contractor_id]
    )

    CreateExpense.call(attrs: attributes)
  end

  def attrs_with_expenses
    permited_attrs.merge(expense_ids: expenses.pluck(:id))
  end

  def permited_attrs
    {
      operation_date: operation_date,
      user_id: user_id,
      contractor_id: attrs[:contractor_id],
      photo: attrs[:photo],
      to_divide: attrs[:to_divide]
    }
  end

  def user_id
    attrs[:user_id] || user.id
  end

  def operation_date
    attrs[:attrs] || Date.today
  end
end
