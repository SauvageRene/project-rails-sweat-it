class AddAdmintosubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :admin, :boolean
  end
end
