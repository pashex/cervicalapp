# This migration comes from rhinoart (originally 20130907102021)
class AddUserToPages < ActiveRecord::Migration
  def change
    change_table :rhinoart_pages do |t|
      t.integer :user_id
      t.foreign_key :rhinoart_users, column: 'user_id'
    end   	
  end
end
