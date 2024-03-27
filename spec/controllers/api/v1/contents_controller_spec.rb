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

      context 'when has no contents' do
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

      context 'when has contents' do
        let(:json) { response.parsed_body }
        let(:json_content) { json.fetch(:content) }
        let(:metadata) { json.fetch(:metadata) }

        let(:movie) { create(:movie) }
        let(:tv_show) { create(:tv_show) }
        let(:season) { create(:season) }
        let(:episode) { create(:episode) }

        let(:create_list) do
          create(:list_content, list: list, content: movie)
          create(:list_content, list: list, content: tv_show)
          create(:list_content, list: list, content: season)
          create(:list_content, list: list, content: episode)
        end

        let(:expected_content) { list.contents.as_json }
        let(:expected_metadata) do
          {
            current_page: 1,
            prev_page: nil,
            next_page: nil,
            total_pages: 1
          }.with_indifferent_access
        end

        before do
          create_list
          subject
        end

        context 'when params have not content_type' do
          it 'returns a success response' do
            expect(response).to be_successful
          end

          it 'returns the contents' do
            expect(json_content).to match(expected_content)
          end

          it 'returns the metadata' do
            expect(metadata).to match(expected_metadata)
          end
        end

        context 'when params has content_type' do
          subject { get :index, params: { list_id: list_id, content_type: content_type } }
          let(:content_type) { nil }

          context 'as Movie' do
            let(:content_type) { 'Movie' }
            let(:expected_content) { movie.as_json }

            it 'returns a success response' do
              expect(response).to be_successful
            end

            it 'returns the contents' do
              expect(json_content).to match([expected_content])
            end

            it 'returns the metadata' do
              expect(metadata).to match(expected_metadata)
            end
          end

          context 'as TvShow' do
            let(:content_type) { 'TvShow' }
            let(:expected_content) { tv_show.as_json }

            it 'returns a success response' do
              expect(response).to be_successful
            end

            it 'returns the contents' do
              expect(json_content).to match([expected_content])
            end

            it 'returns the metadata' do
              expect(metadata).to match(expected_metadata)
            end
          end

          context 'as Season' do
            let(:content_type) { 'Season' }
            let(:expected_content) { season.as_json }

            it 'returns a success response' do
              expect(response).to be_successful
            end

            it 'returns the contents' do
              expect(json_content).to match([expected_content])
            end

            it 'returns the metadata' do
              expect(metadata).to match(expected_metadata)
            end
          end

          context 'as Episode' do
            let(:content_type) { 'Episode' }
            let(:expected_content) { episode.as_json }

            it 'returns a success response' do
              expect(response).to be_successful
            end

            it 'returns the contents' do
              expect(json_content).to match([expected_content])
            end

            it 'returns the metadata' do
              expect(metadata).to match(expected_metadata)
            end
          end
        end
      end
    end
  end
end
