class CreateUserPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_permissions do |t|
      t.integer :permission_id
      t.integer :user_id
      t.json :available_actions, default: {}

      t.timestamps
    end

    add_index :user_permissions, :permission_id
    add_index :user_permissions, :user_id
  end
end
