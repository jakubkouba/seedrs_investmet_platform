RSpec.describe Investment, type: :model do
  it { is_expected.to validate_presence_of :amount }
  it { is_expected.to validate_presence_of :campaign }

  it { is_expected.to belong_to :campaign }
end
