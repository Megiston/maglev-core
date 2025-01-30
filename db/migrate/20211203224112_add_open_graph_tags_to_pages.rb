class AddOpenGraphTagsToPages < ActiveRecord::Migration[6.0]
  def change
    change_table :maglev_pages do |t|
      t.json :og_title_translations
      t.json :og_description_translations
      t.json :og_image_url_translations
    end
  end
end
