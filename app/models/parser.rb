class Parser < ApplicationRecord
  belongs_to :link
  has_many :records
end
