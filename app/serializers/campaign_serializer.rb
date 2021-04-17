class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :percent_raised, :target_amount, :investment_multiple, :sector, :country
end
