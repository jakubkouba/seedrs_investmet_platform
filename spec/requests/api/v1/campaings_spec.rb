# frozen_string_literal: true

RSpec.describe Api::V1::CampaignsController, type: :request do
  describe 'GET /api/v1/campaigns' do
    subject(:campaigns) { get '/api/v1/campaigns' }

    it 'returns success response' do
      campaigns
      debugger
      expect(response).to have_http_status 200
    end

    context 'when campaigns exists' do
      let!(:campaigns_list) { create_list(:campaign, 2) }

      it 'returns list of campaigns' do
        campaigns

        campaigns = JSON.parse(response.body)
        expect(campaigns.count).to eq 2
      end
    end
  end
end
