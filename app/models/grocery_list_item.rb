class GroceryListItem < ApplicationRecord
    validates :itemname, :quantity, presence: true
    after_destroy_commit do
        broadcast_to self, deleted: true, id: self.id
      end

end
