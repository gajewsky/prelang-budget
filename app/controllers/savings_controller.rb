# Savings Controller
class SavingsController < ApplicationController
  before_action :set_saving, only: %i(show edit update destroy)

  def index
    savings = Saving.order('operation_date DESC')
    @total_value = savings.map(&:value).reduce(:+)
    @savings = savings.page(params[:page])
  end

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new(saving_params)
    if @saving.save
      redirect_to new_saving_url, notice: 'Saving was successfully created.'
    else
      render :new
    end
  end

  def update
    if @saving.update(saving_params)
      redirect_to savings_url, notice: 'Saving was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @saving.destroy
    redirect_to savings_url, notice: 'Saving was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_saving
    @saving = Saving.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def saving_params
    params.require(:saving).permit(
      :operation_date,
      :description,
      :value
    )
  end
end
