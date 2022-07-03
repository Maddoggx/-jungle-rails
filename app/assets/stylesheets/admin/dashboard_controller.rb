class Admin::DashboardController < ApplicationController
  def show
    @categories = Category.count(:id)
    @products = Product.all.count
  end

  def category_count
    
  end

  def product_count
    
  end
end
Footer
