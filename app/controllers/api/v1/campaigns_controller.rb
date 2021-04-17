# frozen_string_literal: true

module Api
  module V1
    class CampaignsController < ApplicationController
      def index
        render json: Campaign.all.to_json
      end
    end
  end
end
