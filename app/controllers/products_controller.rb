class ProductsController < ApplicationController
  # DISABLE LOGIN FOR HOMEPAGE
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    # load all the products for the homepage
    @products = Product.all
  end
end
