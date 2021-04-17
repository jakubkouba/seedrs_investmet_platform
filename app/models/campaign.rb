# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, :target_amount, :investment_multiple, presence: true
  validates :target_amount, numericality: { less_than: 1_000_000_000.00 }
end
