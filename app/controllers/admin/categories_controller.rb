class Admin::CategoriesController < ApplicationController
  before_filter :authenticate

  def index
    @categories = Category.order(id: :desc).all
  end
  

  def new
    @categorie = Category.new
  end

  def create
    @categorie = Category.new(categorie_params)

    if @categorie.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private
  def categorie_params 
    params.require(:category).permit(:name)
  end



  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTHENTICATION_NAME"] && password == ENV["BASIC_AUTHENTICATION_PASSWORD"]
    end
  end

end