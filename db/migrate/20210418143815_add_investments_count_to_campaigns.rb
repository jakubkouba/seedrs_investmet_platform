class AddInvestmentsCountToCampaigns < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :investments_count, :integer, default: 0
  end
end
