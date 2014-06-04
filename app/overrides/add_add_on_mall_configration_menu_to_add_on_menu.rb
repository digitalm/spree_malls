Deface::Override.new(:virtual_path => 'spree/admin/add_on_menu/index',
  :name => 'add_add_on_mall_configration_menu_to_add_on_menu',
  :insert_bottom => "[data-hook='admin_add_on_menu_sidebar_menu']",
  :text => "
    <%= configurations_sidebar_menu_item t('add_on.add_on_mall'), admin_add_on_malls_path %>
  ")