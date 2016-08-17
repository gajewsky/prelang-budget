require 'rails_helper'

RSpec.describe "incomes/show", type: :view do
  before(:each) do
    @income = assign(:income, Income.create!(
      :value => "9.99",
      :subcategory => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
