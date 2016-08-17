require 'rails_helper'

RSpec.describe "incomes/edit", type: :view do
  before(:each) do
    @income = assign(:income, Income.create!(
      :value => "9.99",
      :subcategory => nil
    ))
  end

  it "renders the edit income form" do
    render

    assert_select "form[action=?][method=?]", income_path(@income), "post" do

      assert_select "input#income_value[name=?]", "income[value]"

      assert_select "input#income_subcategory_id[name=?]", "income[subcategory_id]"
    end
  end
end
