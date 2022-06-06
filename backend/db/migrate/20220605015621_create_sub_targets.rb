class CreateSubTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_targets do |t|
      t.string :sub_target_n
      t.string :sub_target_ne
      t.string :sub_target_e
      t.string :sub_target_se
      t.string :sub_target_s
      t.string :sub_target_sw
      t.string :sub_target_w
      t.string :sub_target_nw

      t.references :main_target, foreign_key: true
      t.timestamps
    end
    add_index :sub_targets, [:main_target_id, :created_at]
  end
end
