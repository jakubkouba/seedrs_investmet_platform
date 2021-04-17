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
  end
end
