require 'rails_helper'

RSpec.describe "incomes/new", type: :view do
  before(:each) do
    assign(:income, Income.new(
      :value => "9.99",
      :subcategory => nil
    ))
  end

  it "renders new income form" do
    render

    assert_select "form[action=?][method=?]", incomes_path, "post" do

      assert_select "input#income_value[name=?]", "income[value]"

      assert_select "input#income_subcategory_id[name=?]", "income[subcategory_id]"
    end
  end
end
