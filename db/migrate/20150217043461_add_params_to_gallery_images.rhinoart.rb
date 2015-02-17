# This migration comes from rhinoart (originally 20141104090330)
class AddParamsToGalleryImages < ActiveRecord::Migration
	def change
		add_column :rhinoart_gallery_images, :params, :text
	end
end
