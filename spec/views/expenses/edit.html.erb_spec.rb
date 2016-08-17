require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      :description => "MyText",
      :value => "9.99",
      :subcategory => nil,
      :user => nil
    ))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do

      assert_select "textarea#expense_description[name=?]", "expense[description]"

      assert_select "input#expense_value[name=?]", "expense[value]"

      assert_select "input#expense_subcategory_id[name=?]", "expense[subcategory_id]"

      assert_select "input#expense_user_id[name=?]", "expense[user_id]"
    end
  end
end
