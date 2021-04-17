class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name, limit: 256, null: false
      t.string :image
      t.integer :percent_raised, limit: 3, default: 0
      t.decimal :target_amount, precision: 10, scale: 2, null: false
      t.string :sector, limit: 256
      t.string :country, limit: 256, null: false
      t.decimal :investment_multiple, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
