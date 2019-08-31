require 'rails_helper'

RSpec.describe BillsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      let(:user) { create :user }
      let(:category) { create :category }
      let!(:subcategory) { create :subcategory, category_id: category.id }
      let(:bill_params) do
        attributes_for :bill, user_id: user.id, expenses_attributes: expenses_attributes
      end

      let(:expenses_attributes) do
        [
          attributes_for(:expense, user_id: user.id, subcategory_id: subcategory.id)
        ]
      end

      let(:post_request) do
        post :create, params: { bill: bill_params }
      end

      before { sign_in user }

      it 'creates bill and associated expense' do
        expect { post_request }
          .to change(Bill, :count).from(0).to(1)
          .and change(Expense, :count).from(0).to(1)
      end
    end
  end
end

