class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    # @product = Product.find(params[:id])
    @a_dat = {}
    Product.find(1).properties.keys.each do |key|
      @a_dat[key] = {}
      Product.all.each do |item|
      @a_dat[key][item.properties[key]] = [] unless @a_dat[key].has_key?(item.properties[key])
       @a_dat[key][item.properties[key]] << item.id
    end
    end
    @a_dat
  end

  def new
    @product = Product.new(product_type_id: params[:product_type_id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    # binding.pry
    @product = Product.new(params[:product])
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end
end
