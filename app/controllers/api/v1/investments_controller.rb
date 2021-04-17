# frozen_string_literal: true

module Api
  module V1
    class InvestmentsController < ApplicationController
      def create
        investment = Investment.new(investment_params)
        if investment.valid?
          investment.save
          render json: {}, status: 201
        else
          render json: {
            error: 'Could not create an investment',
            message: investment.errors.messages
          }, status: 400
        end
      end

      private

      def investment_params
        params.permit(:amount, :campaign_id)
      end
    end
  end
end
