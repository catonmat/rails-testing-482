class ProductsController < ApplicationController
  # DISABLE LOGIN FOR HOMEPAGE
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    # load all the products for the homepage
    @products = Product.all
  end

  def new
    # provide an empty product for the simple form
    @product = Product.new
  end

  def create
    # create a new product from product_params
    @product = Product.new(product_params)
    # if the product saves redirect to the homepage
    if @product.save
      redirect_to root_path
    else
      # else render an error on simple form
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :tagline)
  end
end
