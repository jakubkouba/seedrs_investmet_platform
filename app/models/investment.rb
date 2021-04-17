class Investment < ApplicationRecord
  belongs_to :campaign

  validates :amount, presence: true
end
