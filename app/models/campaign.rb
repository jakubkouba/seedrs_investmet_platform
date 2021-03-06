# frozen_string_literal: true

class Campaign < ApplicationRecord
  has_many :investments

  validates :name, :target_amount, :investment_multiple, presence: true
  validates :target_amount, numericality: { less_than: 1_000_000_000.00 }
  validates :investment_multiple, numericality: { less_than: 500_000_000.00 }
  validates :name, :sector, :country, length: { maximum: 256 }

  def self.filter_by(params)
    where(params)
  end
end
