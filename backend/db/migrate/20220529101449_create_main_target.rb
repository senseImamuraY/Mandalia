class CreateMainTarget < ActiveRecord::Migration[7.0]
  def change
    create_table :main_targets do |t|
      t.string :target_main
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
