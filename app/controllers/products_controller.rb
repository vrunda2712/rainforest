class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product.id)
      flash[:notice] = "You successfully created a new product!"
    else
      render new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
      flash[:notice] = "You successfully updated a product!"
    else
      redirect_back_or_to @product
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
    flash[:notice] = "You successfully deleted a product!"
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
