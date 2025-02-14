class GroceryListItemsController < ApplicationController
  before_action :set_grocery_list_item, only: %i[ show edit update destroy toggle_status ]

  # GET /grocery_list_items or /grocery_list_items.json
  def index
    @grocery_list_items = GroceryListItem.all
  end

  # GET /grocery_list_items/1 or /grocery_list_items/1.json
  def show
  end

  # GET /grocery_list_items/new
  def new
    @grocery_list_item = GroceryListItem.new
  end

  # GET /grocery_list_items/1/edit
  def edit
  end

  # POST /grocery_list_items or /grocery_list_items.json
  def create
    @grocery_list_item = GroceryListItem.new(grocery_list_item_params)

    respond_to do |format|
      if @grocery_list_item.save
        format.html { redirect_to @grocery_list_item, notice: "Grocery list item was successfully created." }
        format.json { render :show, status: :created, location: @grocery_list_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grocery_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grocery_list_items/1 or /grocery_list_items/1.json
  def update
    respond_to do |format|
      if @grocery_list_item.update(grocery_list_item_params)
        format.html { redirect_to @grocery_list_item, notice: "Grocery list item was successfully updated." }
        format.json { render :show, status: :ok, location: @grocery_list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grocery_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_status
    @grocery_list_item.update(status: !@grocery_list_item.status)
  
    if @grocery_list_item.status
      DeleteGroceryListItemJob.set(wait: 5.seconds).perform_later(@grocery_list_item.id)
    end
  
    # Broadcast the updated grocery list item to connected clients
    GroceryListItemChannel.broadcast_to(@grocery_list_item, { status: @grocery_list_item.status })
  
    respond_to do |format|
      format.html { redirect_to grocery_list_items_path, notice: "Status Updated!" }
      format.json { head :no_content }
    end
  end

  # DELETE /grocery_list_items/1 or /grocery_list_items/1.json
  def destroy
    @grocery_list_item = GroceryListItem.find(params[:id])
    @grocery_list_item.destroy

    # Broadcast to the channel for this item
    GroceryListItemChannel.broadcast_to(@grocery_list_item, { deleted: true, id: @grocery_list_item.id })

    redirect_to grocery_list_items_path
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery_list_item
      @grocery_list_item = GroceryListItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def grocery_list_item_params
      params.expect(grocery_list_item: [ :itemname, :status, :store, :quantity ])
    end
end
