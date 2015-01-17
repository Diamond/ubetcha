class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.string :name
      t.boolean :win
      t.integer :bet_id

      t.timestamps null: false
    end
  end
end
