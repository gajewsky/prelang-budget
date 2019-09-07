class CreateExpense
  extend ServiceObject

  def initialize(attrs:)
    @attrs = attrs
  end

  def call
    expense = Expense.new(permited_attrs)
    expense.tag_list.add(*attrs[:tag_list])

    expense.save!

    expense
  end

  private

  attr_reader :attrs

  def permited_attrs
    attrs.slice(
      :description,
      :contractor_id,
      :value,
      :user_id,
      :to_divide,
      :track,
      :operation_date,
      :subcategory_id
    )
  end
end
