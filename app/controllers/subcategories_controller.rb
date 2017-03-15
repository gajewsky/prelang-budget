# Subcategories Controller
class SubcategoriesController < ApplicationController
  def show
    @subcategory =
      Subcategory
      .includes(incomes: :user, expenses: [:user, :taggings])
      .find(params[:id])
  end
end
