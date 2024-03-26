class Api::V1::ContentsController < Api::V1::BaseController
  def index
    render json: List.find(params[:list_id])&.contents
  end
end
