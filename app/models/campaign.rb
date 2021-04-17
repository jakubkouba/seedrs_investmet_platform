# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, presence: true
end
