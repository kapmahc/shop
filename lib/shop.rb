require 'shop/engine'

module Shop
  def Shop.dashboard(user)
    links = [
        {label: 'shop.addresses.index.title', href: 'addresses_path'},
        # {label: 'shop.orders.index.title', href: 'orders_path'},
        # {label: 'shop.returns.index.title', href: 'returns_path'},
    ]
    if user.is_admin?
      links << nil

      links << {label: 'shop.countries.index.title', href: 'countries_path'}
      links << {label: 'shop.currencies.index.title', href: 'currencies_path'}
      links << {label: 'shop.payment_methods.index.title', href: 'payment_methods_path'}
      links << {label: 'shop.shipping_methods.index.title', href: 'shipping_methods_path'}
      links << {label: 'shop.tags.index.title', href: 'tags_path'}
      links << {label: 'shop.property_fields.index.title', href: 'property_fields_path'}
      links << {label: 'shop.products.index.title', href: 'products_path'}

      # links << {label: 'shop.orders.index.title', href: 'orders_path'}
      # links << {label: 'shop.returns.index.title', href: 'returns_path'}
      # links << {label: 'shop.profile.index.title', href: 'admin_profile_path'}
    end

    {
        label: 'shop.dashboard.title',
        links: links
    }
  end
end
