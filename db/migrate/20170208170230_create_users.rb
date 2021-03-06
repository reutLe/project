class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :admin
      t.string :email
      t.string :days_in_week

      t.timestamps
    end
  end
end
