# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, :target_amount, :investment_multiple, presence: true
end
