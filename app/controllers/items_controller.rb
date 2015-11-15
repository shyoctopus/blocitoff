class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = current_user.items
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Your item was saved."
    else
      # flash bad
      flash[:error] = "WTF?"
    end

    respond_to do |format|
      format.html { redirect_to items_path}
      format.js 
    end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      flash[:notice] = "Well done!"
      redirect_to items_path
    else
      flash[:error] = "Doh!"
      render :edit
    end
  end

  def show
  end

  def destroy

    if @item.destroy
      #flash good
    else
      #flash bad
    end
    respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  def set_item
    @item = current_user.items.find(params[:id])
  end

end
