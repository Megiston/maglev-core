class TranslateSectionContent < ActiveRecord::Migration[6.0]
  def change
    remove_column :maglev_sites, :sections, :json
    add_column :maglev_sites, :sections_translations, :json
    remove_column :maglev_pages, :sections, :json
    add_column :maglev_pages, :sections_translations, :json
  end
end
