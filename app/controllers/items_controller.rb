class ItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to users_show_path
    else
      flash[:alert] = "Item could not be saved."
      redirect_to users_show_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
