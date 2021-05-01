class Link < ApplicationRecord
  has_many :records
  belongs_to :website
  has_many :parsers
end
