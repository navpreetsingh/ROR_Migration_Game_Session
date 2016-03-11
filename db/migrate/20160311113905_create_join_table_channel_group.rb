class CreateJoinTableChannelGroup < ActiveRecord::Migration
  def change
    create_join_table :channels, :groups do |t|
      t.index [:channel_id, :group_id]
      # t.index [:group_id, :channel_id]
    end
  end
end
