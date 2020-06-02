require 'rails_helper'

RSpec.describe Import::RevolutAdapter do
  subject do
    described_class.call(content: content)
  end

  let(:user) { create :user }
  let(:description) { 'Description' }

  let!(:revolut_subcategory) { create :subcategory, title: 'Revolut' }
  let(:content) do
    [
      {
        completed_date: 'Aug 9, 2019',
        description: description,
        "paid_out_(pln)": 63.0,
        "balance_(pln)": 636.31,
        category: 'restaurants',
        notes: 'some notes'
      }
    ]
  end

  let(:expected_result) do
    [
      {
        bill_attrs: {
          contractor_id: expected_contractor_id,
          operation_date: '2019-08-09'
        },

        expenses_attrs: [
          {
            description: "#{description} - restaurants - some notes",
            subcategory_id: expected_subcategory_id,
            tag_list: ['revolut'],
            value: 63.0
          }
        ]
      }
    ]
  end


  context 'when contractor is on ignored list' do
    let(:description) { 'Cash at' }

    it 'omits expense' do
      expect(subject).to eq []
    end
  end

  context 'when there is no paid value' do
    let(:content) do
      [
        {
          completed_date: 'Aug 9, 2019',
          description: description,
          "paid_in_(pln)": 63.0,
        }
      ]
    end

    it 'omits expense' do
      expect(subject).to eq []
    end
  end

  context 'when it has known contractor existing in db' do
    let(:description) { 'Contractor Name' }
    let(:expected_contractor_id) { contractor.id }

    context 'and contractor has associated default category' do
      let!(:contractor) { create :contractor, revolut_id: 'Contractor Name', subcategory_id: 13 }
      let(:expected_subcategory_id) { 13 }

      it 'omits expense when contractor is on ignored list' do
        expect(subject).to eq expected_result
      end
    end

    context 'and description has part of revolut_id' do
      let!(:contractor) { create :contractor, revolut_id: 'Contractor Name Something', subcategory_id: 13 }
      let(:expected_subcategory_id) { 13 }

      it 'finds contractor using regexp' do
        expect(subject).to eq expected_result
      end
    end

    context 'and contractor has not associated default category' do
      let!(:contractor) { create :contractor, revolut_id: 'Contractor Name' }

      let(:expected_subcategory_id) { revolut_subcategory.id }

      it 'omits expense when contractor is on ignored list' do
        expect(subject).to eq expected_result
      end
    end
  end


  context 'when it has unknown contractor not existing in db' do
    let(:expected_contractor_id) { nil }
    let(:expected_subcategory_id) { revolut_subcategory.id }

    it 'omits expense when contractor is on ignored list' do
      expect(subject).to eq expected_result
    end
  end
end

