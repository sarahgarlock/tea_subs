class CreateJoinTableTeasSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_join_table :teas, :subscriptions do |t|
      t.index [:tea_id, :subscription_id]
      t.index [:subscription_id, :tea_id]
    end
  end
end
