class ProductsController < ApplicationController

  def new
    @item = Product.new
  end

  def create
    @item = Product.new(params.required(:product).permit(:name, :price, :description, :store_id))

    if @item.save!
      redirect_back(fallback_location: stores_path)
    else
      render :new
    end
  end
end
