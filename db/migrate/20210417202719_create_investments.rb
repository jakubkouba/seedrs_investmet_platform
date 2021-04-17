class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
