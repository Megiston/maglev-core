class AddLocalesToSites < ActiveRecord::Migration[6.0]
  def change
    add_column :maglev_sites, :locales, :json
  end
end
