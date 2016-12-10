require 'shop/engine'

module Shop
  def self.dashboard(user)
    links = [
        {label: 'shop.addresses.index.title', href: 'addresses_path'},
        {label: 'shop.orders.index.title', href: 'orders_path'},
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

      # links << {label: 'shop.returns.index.title', href: 'returns_path'}
      # links << {label: 'shop.profile.index.title', href: 'admin_profile_path'}
    end

    {
        label: 'shop.dashboard.title',
        links: links
    }
  end


  def self.sitemap
    app = Shop::Engine.routes.url_helpers
    links = []
    Setting.languages.each do |l|

      links << {url: app.hot_variants_path(locale:l)}
      links << {url: app.latest_variants_path(locale:l)}
      links << {url: app.comments_path(locale:l)}

      links += Product.select(:id, :updated_at).map do |i|
        {url:product_path(i), lastmod:i.updated_at}
      end

      links << {url: app.root_path(locale:l)}
    end
    links
  end
end
