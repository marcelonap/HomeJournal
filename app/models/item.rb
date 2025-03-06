class Item < ApplicationRecord
  has_rich_text :description
  belongs_to :errand
  broadcasts_to :errand
end
