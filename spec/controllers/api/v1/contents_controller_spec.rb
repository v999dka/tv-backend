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

        let(:expected_metadata) { {current_page: 1, prev_page: nil, next_page: nil, total_pages: 0}.with_indifferent_access }
        let(:json) { response.parsed_body }
        let(:content) { json.fetch(:content) }
        let(:metadata) { json.fetch(:metadata) }

        it 'returns a success response' do
          expect(response).to be_successful
        end

        it 'returns an empty response' do
          expect(content).to match([])
        end

        it 'returns the metadata' do
          expect(metadata).to match(expected_metadata)
        end
      end

      context 'when the list has contents' do
        before do
          list_content
          subject
        end

        let(:content) { create(:content) }
        let(:list_content) { create(:list_content, list: list, content: content) }

        let(:expected_metadata) { {current_page: 1, prev_page: nil, next_page: nil, total_pages: 1}.with_indifferent_access }
        let(:json) { response.parsed_body }
        let(:json_content) { json.fetch(:content) }
        let(:metadata) { json.fetch(:metadata) }


        it 'returns a success response' do
          expect(response).to be_successful
        end

        it 'returns the contents' do
          expect(json_content).to match([content.as_json])
        end

        it 'returns the metadata' do
          expect(metadata).to match(expected_metadata)
        end
      end
    end
  end
end
