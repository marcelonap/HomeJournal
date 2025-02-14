class ListItem < ApplicationRecord
    validates :name, :qty, presence: true
end
