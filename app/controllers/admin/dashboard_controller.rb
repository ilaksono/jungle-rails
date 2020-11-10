class Admin::DashboardController < ApplicationController
  def show
    @num_prods = Product.count
    @num_cats = Category.count
  end
end
