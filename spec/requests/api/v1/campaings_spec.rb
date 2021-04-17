# frozen_string_literal: true

RSpec.describe Api::V1::CampaignsController, type: :request do
  describe 'GET /api/v1/campaigns' do
    subject(:campaigns) { get '/api/v1/campaigns' }

    it 'returns success response' do
      campaigns

      expect(response).to have_http_status 200
    end
  end
end
