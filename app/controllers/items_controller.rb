class ItemsController < ApplicationController

  before_action :authenticate_user!

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Item could not be saved."
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @item = Item.where(id: params[:item_ids]).destroy_all
    flash[:notice] = "Item(s) successfully completed."
    redirect_to user_path
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
