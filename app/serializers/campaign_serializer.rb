class CampaignSerializer < ActiveModel::Serializer
  attributes :name, :image, :percent_raised, :target_amount, :sector, :country
end
