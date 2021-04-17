# frozen_string_literal: true

module Api
  module V1
    class InvestmentsController < ApplicationController
      def create
        Investment.create!(investment_params)

        render json: {}, status: 201
      end

      private

      def investment_params
        params.permit(:amount, :campaign_id)
      end
    end
  end
end
