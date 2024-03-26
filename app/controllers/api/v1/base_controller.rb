class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :content_not_found

  def content_not_found
    head :not_found
  end
end
