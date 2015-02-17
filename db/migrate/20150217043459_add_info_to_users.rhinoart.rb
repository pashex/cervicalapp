# This migration comes from rhinoart (originally 20140714175033)
class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :rhinoart_users, :info, :text
  end
end
