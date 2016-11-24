require 'shop/engine'

module Shop
  def Shop.dashboard(user)
    links = [
        {label: 'shop.addresses.index.title', href: 'addresses_path'},
        {label: 'shop.orders.index.title', href: 'orders_path'},
        {label: 'shop.returns.index.title', href: 'returns_path'},
    ]
    if user.is_admin?
      links << nil
      links << {label: 'shop.admin.products.index.title', href: 'admin_products_path'}
      links << {label: 'shop.admin.orders.index.title', href: 'admin_orders_path'}
      links << {label: 'shop.admin.returns.index.title', href: 'admin_returns_path'}
      links << {label: 'shop.admin.profile.index.title', href: 'admin_profile_path'}
    end

    {
        label: 'shop.dashboard.title',
        links: links
    }
  end
end
