class CreateExpense
  def initialize(attrs:)
    @attrs = attrs
  end

  def call
    Expense.create(permited_attrs)
  end

  private

  attr_reader :attrs

  def permited_attrs
    attrs.slice(
      :id,
      :description,
      :contractor_id,
      :value,
      :user_id,
      :to_divide,
      :track,
      :operation_date,
      :subcategory_id,
      :tag_list
    )
  end
end
