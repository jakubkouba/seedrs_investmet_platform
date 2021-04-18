# frozen_string_literal: true

module Api
  module V1
    class CampaignsController < ApplicationController
      def index
        return render json: {}, status: 404 if invalid_search_params?

        render json: Campaign.filter_by(search_params).page(pagination_params[:page]).per(pagination_params[:per_page])
      end

      private

      def pagination_params
        params.permit(:page, :per_page)
      end

      def search_params
        params.permit(search: %i[name sector country investments_count])[:search]
      end

      def invalid_search_params?
        return false unless params[:search]

        true if (params[:search].keys & search_params.keys).empty?
      end
    end
  end
end
