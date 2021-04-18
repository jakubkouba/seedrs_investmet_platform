RSpec.describe Investment, type: :model do

  it { is_expected.to validate_presence_of :amount }
  it { is_expected.to validate_presence_of :campaign }

  it { is_expected.to belong_to(:campaign).counter_cache(true) }

  describe 'when amount is not multiple of investment multiple' do
    let(:campaign) { create(:campaign, investment_multiple: 50.00) }
    let(:investment) { described_class.new(amount: 40.00, campaign: campaign) }

    it 'is invalid' do
      expect(investment.invalid?).to be true
      expect(investment.errors.messages[:investment_multiple].first).to eq 'Invested amount in not a multiple of investment multiple'
    end
  end
end
