# This migration comes from rhinoart (originally 20130514081446)
class AddDescriptionToSettings < ActiveRecord::Migration
  def change
    change_table :rhinoart_settings do |t|
      t.text :descr, :null => true
    end  	  	
  end
end
