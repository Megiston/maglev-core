class CreateMaglevSectionContent < ActiveRecord::Migration[6.0]
  def change
    change_table :maglev_sites do |t|
      t.json :sections
    end

    change_table :maglev_pages do |t|
      t.json :sections
    end
  end
end
