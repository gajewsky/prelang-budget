require 'rails_helper'

RSpec.describe "expenses/new", type: :view do
  before(:each) do
    assign(:expense, Expense.new(
      :description => "MyText",
      :value => "9.99",
      :subcategory => nil,
      :user => nil
    ))
  end

  it "renders new expense form" do
    render

    assert_select "form[action=?][method=?]", expenses_path, "post" do

      assert_select "textarea#expense_description[name=?]", "expense[description]"

      assert_select "input#expense_value[name=?]", "expense[value]"

      assert_select "input#expense_subcategory_id[name=?]", "expense[subcategory_id]"

      assert_select "input#expense_user_id[name=?]", "expense[user_id]"
    end
  end
end
