class Record < ApplicationRecord
  belongs_to :links, optional: true
  belongs_to :records, optional: true
end
