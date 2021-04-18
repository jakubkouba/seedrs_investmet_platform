# frozen_string_literal: true

RSpec.describe Campaign, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:target_amount) }
  it { is_expected.to validate_presence_of(:investment_multiple) }

  it { is_expected.to validate_numericality_of(:target_amount).is_less_than(1_000_000_000.00) }
  it { is_expected.to validate_numericality_of(:investment_multiple).is_less_than(500_000_000.00) }

  it { is_expected.to validate_length_of(:name).is_at_most(256) }
  it { is_expected.to validate_length_of(:sector).is_at_most(256) }
  it { is_expected.to validate_length_of(:country).is_at_most(256) }

  it { is_expected.to have_many :investments }

  describe '.filter_by' do
    subject(:filtered_campaigns) { described_class.filter_by(params) }
    let(:params) { {} }

    context 'when having two campaigns from which one is from Health sector' do
      let!(:first_campaign) { create(:campaign, sector: 'Non-Health-sector') }
      let!(:campaign_from_health_sector) { create(:campaign, name: 'Campaign from Health sector', sector: 'Health') }

      context 'and search campaigns by Health sector' do
        let(:params) { { sector: 'Health' } }

        it { is_expected.to eq [campaign_from_health_sector] }
      end
    end
  end
end
