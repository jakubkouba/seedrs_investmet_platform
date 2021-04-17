# frozen_string_literal: true

RSpec.describe Api::V1::InvestmentsController do

  describe 'POST /api/v1/investments' do
    subject(:create_investment) { post '/api/v1/investments', params: params }
    let(:params) { {} }
    let(:parsed_response) { JSON.parse(response.body) }

    context 'when campaign exists and amount is present' do
      let(:campaign) { create(:campaign) }
      let(:params) { { amount: 1000, campaign_id: campaign.id } }

      it 'returns success response' do
        create_investment

        expect(response).to have_http_status(201)
      end

      it 'creates investment' do
        expect { create_investment }.to change { Investment.count }.by(1)
      end
    end

    context 'when investment is invalid' do
      let(:params) { { amount: 1000, campaign_id: 0 } }

      it 'returns bad request response' do
        create_investment

        expect(response).to have_http_status(400)
      end

      it 'does not create investment' do
        expect { create_investment }.not_to change { Investment.count }
      end

      it 'returns error message' do
        create_investment

        expect(parsed_response.keys).to match(%w[error message])
      end
    end
  end
end