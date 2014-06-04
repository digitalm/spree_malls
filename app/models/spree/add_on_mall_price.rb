module Spree
  class AddOnMallPrice < ActiveRecord::Base
    belongs_to :variant, class_name: 'Spree::Variant', :foreign_key => :variant_id
    belongs_to :add_on_mall, class_name: 'Spree::AddOnMall', :foreign_key => :add_on_mall_id
    validates_uniqueness_of :add_on_mall_id, :scope => :variant_id
    validates_uniqueness_of :amount, :scope => [:add_on_mall_id, :variant_id], allow_nil: true
    validates_uniqueness_of :currency, :scope => [:add_on_mall_id, :variant_id], allow_nil: true
  end
end