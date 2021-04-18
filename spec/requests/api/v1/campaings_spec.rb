# frozen_string_literal: true

RSpec.describe Api::V1::CampaignsController, type: :request do
  describe 'GET /api/v1/campaigns' do
    subject(:campaigns) { get '/api/v1/campaigns', params: params }

    let(:params) { {} }

    it 'returns success response' do
      campaigns

      expect(response).to have_http_status 200
    end

    context 'when having 4 campaigns' do
      let!(:campaigns_list) { create_list(:campaign, 4) }
      
      context 'and asking for 2 campaigns per page' do
        let(:params) { { page: 1, per_page: 2 } }
        let(:returned_campaigns) { JSON.parse(response.body) }

        it 'returns paginated list of campaigns' do
          campaigns

          expect(returned_campaigns.count).to eq 2
        end
      end
    end

    context 'when having two campaigns from which one is from Health sector' do
      let!(:campaign_from_health_sector) { create(:campaign, name: 'Campaign from Health sector', sector: 'Health') }
      let!(:first_campaign) { create(:campaign, sector: 'Non-Health-sector') }

      context 'when search by sector' do
        let(:params) { { page: 1, per_page: 2, search: { sector: 'Health' } } }
        let(:returned_campaigns) { JSON.parse(response.body) }

        it 'returns campaign from Health sector' do
          campaigns

          expect(returned_campaigns.count).to eq 1
          expect(returned_campaigns.first['name']).to eq 'Campaign from Health sector'
        end

      end

      context 'when search by not permitted attribute' do
        let(:params) { { page: 1, per_page: 2, search: { amount: 10 } } }
        let(:returned_campaigns) { JSON.parse(response.body) }

        before { campaigns }

        it 'returns 404 response' do
          expect(response).to have_http_status 404
        end

        it 'does not return any campaign' do
          expect(returned_campaigns.count).to eq 0
        end

      end
    end
  end
end
