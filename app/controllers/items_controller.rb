class ItemsController < ApplicationController
  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    def create
      @item = Item.new(item_params)
      if @prototype.save
      redirect_to '/'
      else
        render :new, status: :unprocessable_entity
      end
    end



  private

  def item_params
    params.require(:item).permit(:image,:name, :description, :user, :image).merge(user_id: current_user.id)  end
end
