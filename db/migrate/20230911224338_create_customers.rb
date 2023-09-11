class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
