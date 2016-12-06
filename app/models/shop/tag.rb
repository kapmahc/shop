require 'closure_tree'

module Shop
  class Tag < ApplicationRecord
    validates :name, presence: true

    # https://github.com/mceachen/closure_tree/issues/233
    has_closure_tree
  end
end
