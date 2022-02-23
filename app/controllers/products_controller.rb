class ProductsController < ApplicationController
	def new
    	@product = Product.new
    	@products = Product.all
  	end

    def create
	    @product = Product.new(product_params)
	    if @product.save
	      redirect_to action: "new"
	    else
	      render :'new', status: :unprocessable_entity
	    end
  	end
  	def destroy 
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to action: "new"
  	end

    def product_params
      params.require(:product).permit(:name, :description)
    end
end
