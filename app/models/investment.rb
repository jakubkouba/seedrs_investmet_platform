class Investment < ApplicationRecord
  belongs_to :campaign

  validates :amount, :campaign, presence: true
  validate :investment_multiple


  private

  def investment_multiple
    message = 'Invested amount in not a multiple of investment multiple'
    errors.add(:investment_multiple, message) unless investment_multiple?
  end

  def investment_multiple?
    return false unless campaign_id

    campaign = Campaign.find(campaign_id)
    (amount % campaign.investment_multiple).zero?
  end
end
