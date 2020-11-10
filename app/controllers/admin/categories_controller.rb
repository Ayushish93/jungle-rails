class Admin::CategoriesController < ApplicationController
before_filter :authenticate

  def index
    @categories = Category.order(id: :desc).all
  end
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTHENTICATION_NAME"] && password == ENV["BASIC_AUTHENTICATION_PASSWORD"]
    end
  end

end