module Spree
  Variant.class_eval do
    has_many :add_on_mall_prices, class_name: 'Spree::AddOnMallPrice'

#   builds add_on_maker_variants from created variant ids
    after_create :create_add_on_mall_prices_from_variants

#   enable variants to CRUD each own add_on_maker_variants by accept nesting as child
    accepts_nested_attributes_for :add_on_mall_prices, allow_destroy: true

    def create_add_on_mall_prices_from_variants
      if Spree::AddOnMall.exists?
        Spree::AddOnMallPrice.where(variant_id: self.id).first_or_initialize do |a|
          a.variant_id = self.id
          logger.info a.inspect
          if a.save
          logger.info "save completed"
          else
          logger.info "save imcompleted!"
          end
        end
      end
    end

  end
end
