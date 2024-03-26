require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: { list_id: list_id } }
    let(:list_id) { -1 }


    context 'when the list does not exist' do
      before { subject }

      it 'returns a not found response' do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when the list exists' do

      let(:list) { create(:list) }
      let(:list_id) { list.id }

      context 'when the list has no contents' do
        before { subject }

        it 'returns a success response' do
          expect(response).to be_successful
        end

        it 'returns an empty response' do
          expect(response.body).to eq('[]')
        end
      end

      context 'when the list has contents' do
        let(:content) { create(:content) }
        let(:list_content) { create(:list_content, list: list, content: content) }

        before do
          list_content
          subject
        end

        it 'returns a success response' do
          expect(response).to be_successful
        end

        it 'returns the contents' do
          expect(response.body).to eq([content.as_json].to_json)
        end
      end
    end
  end
end
