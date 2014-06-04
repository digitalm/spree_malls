module Spree
  module Admin
    class AddOnMallPricesController < ResourceController
      before_filter :load_data

      def new
        session[:return_to] ||= request.referer
        @add_on_malls = Spree::AddOnMall.includes(:add_on_mall_prices).all
        @add_on_mall_prices = Spree::AddOnMallPrice.where(:variant_id => params[:variant_id])
      end

      def show
        session[:return_to] ||= request.referer
        redirect_to( :action => :edit )
      end

      def index
        session[:return_to] = request.url
        @product = Spree::Product.find_by_permalink!(params[:product_id])
        if @product.has_variants?
          @variant = @product.variants.page(params[:page])
        else
          @variant = Spree::Variant.where(:id => @product.master.id).page(params[:page])
        end
        render :index
      end

      def edit
        session[:return_to] = request.url
        @add_on_malls = Spree::AddOnMall.order(:name)
#        @add_on_malls = Spree::AddOnMall.includes(:add_on_mall_prices).where(Spree::AddOnMallPrice.arel_table[:variant_id].eq(params[:variant_id])).references(:add_on_mall_prices).order(:name)
        @add_on_mall_prices = Spree::AddOnMallPrice.includes(:add_on_mall).where(:variant_id => params[:variant_id])
        render :edit
      end

      def create
        begin
          params[:add_on_mall_prices].each_value { |value|
            @add_on_mall_prices = Spree::AddOnMallPrice.new(value)
            @add_on_mall_prices.save
            }
              respond_to do |format|
              flash[:success] = t('add_on.notice_messages.admin_product_variant_add_on_mall_price_variant_created')
                format.html { redirect_to admin_product_add_on_mall_prices_path }
              format.json { render action: 'index', status: :created, location: @add_on_mall_prices }
              end
        rescue
              respond_to do |format|
              flash[:error] = t('add_on.notice_messages.admin_product_variant_add_on_mall_price_variant_has_error')
              format.html { render action: 'new' }
              format.json { render json: @add_on_mall_prices.errors }
              end
        end

      end

      def update
        begin
          params[:add_on_mall_prices].each_value { |value|
            @add_on_mall_prices = Spree::AddOnMallPrice.where(:variant_id => value["variant_id"], :add_on_mall_id => value["add_on_mall_id"]).first_or_initialize
            @add_on_mall_prices.update(value)
            logger.info @add_on_mall_prices.errors.inspect
            }
          respond_to do |format|
            flash[:success] = t('add_on.notice_messages.admin_product_variant_add_on_mall_price_variant_updated')
            format.html { redirect_to :action => :index }
            format.json { head :no_content }
          end
        rescue
          respond_to do |format|
            flash[:error] = t('add_on.notice_messages.admin_product_variant_add_on_mall_price_variant_has_error')
            format.html { render action: 'edit' }
            format.json { render json: @add_on_mall_price_variant.errors }
          end
        end
      end

      def destroy
        @variant = Spree::Variant.find(params[:id])
        if @variant.destroy
          flash[:success] = Spree.t('notice_messages.variant_deleted')
        else
          flash[:success] = Spree.t('notice_messages.variant_not_deleted')
        end

        respond_with(@variant) do |format|
          format.html { redirect_to admin_product_maker_variant_path(params[:product_id]) }
          format.js  { render_js_for_destroy }
        end
      end

  protected
      def variant_includes
        [:add_on_mall_price_variants]
      end

      def load_data
        @product = Spree::Product.find_by_permalink!(params[:product_id])
        @taxons = Taxon.order(:name)
        @option_types = OptionType.order(:name)
        @tax_categories = TaxCategory.order(:name)
        @shipping_categories = ShippingCategory.order(:name)
        @add_on_malls = Spree::AddOnMall.order(:name)
      end

  private
      def permit_attributes
        params.require(:add_on_mall_prices).value.permit!
      end

      def add_on_mall_price_variant_params
        params.require(:add_on_mall_prices).value.permit(:variant_id, :add_on_mall_id, :amount, :currency)
      end

    end
  end
end