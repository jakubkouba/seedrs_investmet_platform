RSpec.describe Investment, type: :model do
  it { is_expected.to validate_presence_of :amount }
end
