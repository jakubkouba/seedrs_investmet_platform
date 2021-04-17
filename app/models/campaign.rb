# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, :target_amount, presence: true
end
