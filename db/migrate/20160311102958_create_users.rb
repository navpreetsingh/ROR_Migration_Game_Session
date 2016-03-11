class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
