# frozen_string_literal: true

module Api
  module V1
    class CampaignsController < ApplicationController
      def index
        render json: Campaign.page(params[:page]).per(params[:per_page])
      end
    end
  end
end
