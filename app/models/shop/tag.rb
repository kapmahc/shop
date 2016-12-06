require 'closure_tree'

module Shop
  class Tag < ApplicationRecord
    validates :name, :sort_order, presence: true

    # https://github.com/mceachen/closure_tree/issues/233
    has_closure_tree order: 'sort_order'
  end
end
