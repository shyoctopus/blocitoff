class ItemsController < ApplicationController
  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Your item was saved."
      redirect_to items_path
    else
      # flash bad
      flash[:error] = "WTF?"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @item = current_user.items.find(params[:id])
  end

  def destroy
    @item = current_user.items.find(params[:id])

    if @item.destroy
      #flash good
    else
      #flash bad
    end

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
