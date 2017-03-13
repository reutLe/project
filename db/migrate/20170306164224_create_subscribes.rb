class CreateSubscribes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribes do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true
      t.date :chosen_date

      t.timestamps
    end
  end
end
