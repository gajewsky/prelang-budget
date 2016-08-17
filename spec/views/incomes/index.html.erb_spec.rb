require 'rails_helper'

RSpec.describe "incomes/index", type: :view do
  before(:each) do
    assign(:incomes, [
      Income.create!(
        :value => "9.99",
        :subcategory => nil
      ),
      Income.create!(
        :value => "9.99",
        :subcategory => nil
      )
    ])
  end

  it "renders a list of incomes" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
