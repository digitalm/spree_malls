Spree::Admin::VariantsController.class_eval do
  before_filter :load_add_on_mall_price, :only => :load_data

  def load_add_on_mall_price
    @add_on_mall_price = Spree::AddOnMallPrice.where(:variant_id => @variant.id).first
    logger.info "####### loaded_add_on_mall_price ########"
    logger.info @add_on_mall_price
  end

  private
      def variant_params
        params.require(:variant).permit(add_on_mall_price_attributes: [ :variant_id, :mall_id, :amount, :currency])
      end
end