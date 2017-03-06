class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :goals
      t.string :ages
      t.string :act_kind
      t.string :act_description
      t.string :openning_game
      t.string :methods
      t.string :accessories

      t.timestamps
    end
  end
end
