class CreateMainTarget < ActiveRecord::Migration[7.0]
  def change
    create_table :main_targets do |t|
      t.string :target_main
      t.string :target_n
      t.string :target_ne
      t.string :target_e
      t.string :target_se
      t.string :target_s
      t.string :target_sw
      t.string :target_w
      t.string :target_nw
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
