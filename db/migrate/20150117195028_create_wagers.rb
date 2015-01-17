class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :bet_id
      t.integer :outcome_id

      t.timestamps null: false
    end
  end
end
