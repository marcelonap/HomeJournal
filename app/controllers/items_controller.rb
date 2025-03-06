class ItemsController < ApplicationController
  before_action :set_errand

  def create
    @errand.items.create! params.expect(item: [ :name, :description, :quantity ])
    redirect_to @errand
  end

  def destroy
    item = @errand.items.find(params[:id])
    item.destroy!
    redirect_to @errand
  end


  private
    def set_errand
      @errand = Errand.find(params[:errand_id])
    end
end
