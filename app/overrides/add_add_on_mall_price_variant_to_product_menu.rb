Deface::Override.new(:virtual_path => 'spree/admin/shared/_product_tabs',
  :name => 'add_add_on_mall_price_variant_to_product_menu',
  :insert_bottom => "[data-hook='admin_product_tabs']",
  :sequence => {:after => "add_add_on_supplier_variant_to_product_menu"},
  :text => "
      <%= content_tag :li, :class => ('active' if current == 'Add On Mall Price Variants') do %>
        <%= link_to_with_icon 'icon-edit', t('add_on.add_on_mall_prices'), admin_product_add_on_mall_prices_path(@product) %>
      <% end if can?(:admin, Spree::AddOnMallPrice) %>

  ")