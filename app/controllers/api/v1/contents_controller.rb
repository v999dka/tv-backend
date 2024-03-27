class Api::V1::ContentsController < Api::V1::BaseController
  before_action :load_list

  def index
    render json: paginate_content(content)
  end

  private

  def load_list
    @list = List.find(list_id_param)
  end

  def content
    return @list.contents unless type_param.present?

    @list.contents.where(type: type_param)
  end

  def paginate_content(scope)
    scope = scope.page(current_page).per(per_page)
    {
      content: scope,
      metadata: {
        prev_page: scope.prev_page,
        current_page: current_page,
        next_page: scope.next_page,
        total_pages: scope.total_pages
      }
    }
  end

  def list_id_param
    params.permit(:list_id)[:list_id]
  end

  def type_param
    params.permit(:content_type)[:content_type]
  end

  def metadata_params
    params.permit(:page, :per_page)
  end

  def current_page
    metadata_params[:page] || 1
  end

  def per_page
    metadata_params[:per_page] || 20
  end

end

