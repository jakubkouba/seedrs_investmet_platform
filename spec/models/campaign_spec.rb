# frozen_string_literal: true

RSpec.describe Campaign, type: :model do
  it { is_expected.to validate_presence_of(:name) }
end