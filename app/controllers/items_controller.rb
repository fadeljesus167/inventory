class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path, notice: 'Added a new item to inventory'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])

    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Edited an item of inventory'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])

    @item.destroy
    redirect_to items_path, notice: 'You have deleted an item', status: :see_other
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
