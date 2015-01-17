class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :name
      t.string :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
