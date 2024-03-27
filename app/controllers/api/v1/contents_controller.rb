class Api::V1::ContentsController < Api::V1::BaseController
  before_action :load_list

  def index
    render json: paginate_content
  end

  private

  def load_list
    @list = List.find(params[:list_id])
  end

  def paginate_content
    scope = @list.contents.order(:title).page(params[:page] || 1).per(params[:per_page] || 5)
    {
      content: scope,
      metadata: {
        prev_page: scope.prev_page,
        current_page: params[:page] || 1,
        next_page: scope.next_page,
        total_pages: scope.total_pages
      }
    }
  end

end

