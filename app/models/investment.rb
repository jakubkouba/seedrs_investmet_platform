class Investment < ApplicationRecord
  belongs_to :campaign

  validates :amount, :campaign, presence: true
end
