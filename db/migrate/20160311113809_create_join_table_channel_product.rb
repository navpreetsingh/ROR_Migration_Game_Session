class CreateJoinTableChannelProduct < ActiveRecord::Migration
  def change
    create_join_table :channels, :products do |t|
      t.index [:channel_id, :product_id]
      # t.index [:product_id, :channel_id]
    end
  end
end
