require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        :description => "MyText",
        :value => "9.99",
        :subcategory => nil,
        :user => nil
      ),
      Expense.create!(
        :description => "MyText",
        :value => "9.99",
        :subcategory => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
