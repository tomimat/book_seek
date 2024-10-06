class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :user_id
      t.string :coption
      t.timestamps
    end
  end
end
