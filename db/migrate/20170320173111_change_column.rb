class ChangeColumn < ActiveRecord::Migration[5.0]
      def change
          change_column(:activities, :act_description, :text)
          change_column(:activities, :goals, :text)
          change_column(:activities, :openning_game, :text)
          change_column(:activities, :methods, :text)
          change_column(:activities, :accessories, :text)                    
      end
end
