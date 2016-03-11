class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :site_url

      t.timestamps null: false
    end
  end
end
