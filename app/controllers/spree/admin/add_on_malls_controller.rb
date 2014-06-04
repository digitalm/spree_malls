module Spree
  module Admin
    class AddOnMallsController < ResourceController

      def update_values_positions
        params[:positions].each do |id, index|
          AddOnMall.where(:id => id).update_all(:position => index)
        end

        respond_to do |format|
          format.html { redirect_to admin_add_on_malls_url(params[:id]) }
          format.js  { render :text => 'Ok' }
        end
      end

      def index
        @add_on_mall = Spree::AddOnMall.page(params[:page])
      end

  private
      def add_on_mall_params
        params.require(:add_on_mall).permit(add_on_mall_prices_attributes: [ :variant_id, :add_on_mall_id, :amount, :currency ])
      end
    end
  end
end