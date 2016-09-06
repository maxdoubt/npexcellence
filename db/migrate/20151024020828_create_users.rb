class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # authlogic fields
      t.string      :email,                   :null => false
      t.string      :crypted_password,        :null => false
      t.string      :password_salt,           :null => false
      t.string      :persistence_token,       :null => false
      t.string      :single_access_token,     :null => false
      t.string      :perishable_token,        :null => false
      t.integer     :login_count,             :null => false, :default => 0
      t.integer     :failed_login_count,      :null => false, :default => 0
      t.datetime    :current_login_at
      t.datetime    :last_login_at
      t.string      :current_login_ip
      t.string      :last_login_ip

      # our fields
      t.string      :role,               null: false
      t.string      :first_name,         null: false
      t.string      :last_name,          null: false
      t.boolean     :banned,             null: false, default: false
      t.boolean     :validated,          null: false, default: false

      t.string      :phone
      t.string      :address
      t.string      :title
      t.string      :bio
      t.integer     :org_id
      t.string      :submitted_org
      t.attachment  :avatar
      
      # timestamps
      t.timestamps null: false
    end

    add_index :users, [:email],                unique: true, name: :udx_users_on_email
    add_index :users, [:persistence_token],    unique: true, name: :udx_users_on_persistence_token
    add_index :users, [:single_access_token],  unique: true, name: :udx_users_on_single_access_token
    add_index :users, [:perishable_token],     unique: true, name: :udx_users_on_perishable_token

  end
end
