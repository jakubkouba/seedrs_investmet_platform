# frozen_string_literal: true

RSpec.describe Campaign, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:target_amount) }
  it { is_expected.to validate_presence_of(:investment_multiple) }
  it { is_expected.to validate_numericality_of(:target_amount).is_less_than(1_000_000_000.00) }
end
