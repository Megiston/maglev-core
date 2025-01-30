class AddStyleToSites < ActiveRecord::Migration[6.0]
  def change
    change_table :maglev_sites do |t|
      t.json :style
    end
  end
end
