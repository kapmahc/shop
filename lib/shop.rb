require 'shop/engine'

module Shop
  def Shop.dashboard(user)
    {
        label: 'shop.dashboard.title',
        links: [
            {label: '111', href: 'root_path'},
            {label: '222', href: 'root_path'},
            {label: '333', href: 'root_path'},
        ]
    }
  end
end
