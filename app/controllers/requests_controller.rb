class RequestsController < ApplicationController
  respond_to :json

  def index
    respond_with Request.all
  end
end
