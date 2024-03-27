require 'swagger_helper'

RSpec.describe 'ContentsController', type: :request do
  let(:list) { create(:list) }
  let(:list_id) { list.id }

  let(:movies) { create_list(:movie, 5) }
  let(:shows) { create_list(:tv_show, 5) }
  let(:seasons) { create_list(:season, 5, tv_show: shows.first) }
  let(:episodes) { create_list(:episode, 5, season: seasons.first) }

  let(:gen_content) { [movies, shows, seasons, episodes].flatten }
  let!(:list_contents) { gen_content.map { |content| create(:list_content, list: list, content: content) } }
  let(:page) { 1 }
  let(:per_page) { 5 }

  path '/api/v1/lists/{list_id}/contents' do
    get('Get contents from list') do
      produces 'application/json'

      parameter name: :list_id, in: :path, type: :string, description: 'list_id'
      parameter name: :content_type, in: :query, type: :string, required: false, description: 'content_type'
      parameter name: :page, in: :query, type: :integer, required: false, description: 'page'
      parameter name: :per_page, in: :query, type: :integer, required: false, description: 'per_page'


      response(404, 'List not found') do
        let(:list_id) { -1 }
        run_test!
      end

      response(200, 'All content from list') do
        run_test!
      end

      response(200, 'Filtered by Movie') do
        let(:content_type) { 'Movie' }
        run_test!
      end

      response(200, 'Filtered by TVShow') do
        let(:content_type) { 'TvShow' }
        run_test!
      end

      response(200, 'Filtered by Season') do
        let(:content_type) { 'Season' }
        run_test!
      end

      response(200, 'Filtered by Episode') do
        let(:content_type) { 'Episode' }
        run_test!
      end
    end
  end
end
