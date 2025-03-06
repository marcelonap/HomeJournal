class Errand < ApplicationRecord
  has_many :items, dependent: :destroy
end
