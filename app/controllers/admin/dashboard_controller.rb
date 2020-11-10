class Admin::DashboardController < ApplicationController
  def show
    @total = Product.count
    @categorie = Category.count
  end
  
  
 
   
  
end
