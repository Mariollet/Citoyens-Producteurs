class Admin::StoreProductsController < ApplicationController
  before_action :check_if_admin  
  before_action :set_stock,only: [:show,:edit,:destroy]

    
  def new
    @stock = StoreProduct.new
  end

  def create
    @product = Product.find(stock_params[:product])
    @unit = Unit.find(stock_params[:unit])
    @store = Store.find(stock_params[:store])
    @stock = StoreProduct.create(product: @product, unit: @unit, store: @store, quantity: stock_params[:quantity])
    redirect_to admin_store_path(stock_params[:store])
    
  end

  def edit
    
  end

  def update
    @unit = Unit.find(stock_params[:unit])
    
     
    @stock = StoreProduct.find(params[:id]).update(unit: @unit,quantity: stock_params[:quantity])
    redirect_to admin_store_path(params[:store_id])
      
  end

  

  private  

  def set_stock
    #@store= Store.find(params[:store_id])
    @stock= StoreProduct.find(params[:id])
    
  end

  def stock_params

    params.require(:store_product).permit(:product,:unit,:store,:quantity)
  end

  def check_if_admin

    if current_user == nil
      flash[:danger] = "Vous n'avez pas acces a cette page"
      redirect_to '/'
    elsif current_user.is_admin == false
      flash[:danger] = "Vous n'avez pas acces a cette page"
      redirect_to '/'    
    end
  end
end