class CreatePlatforms < ActiveRecord::Migration
  def self.up
    create_table :platforms do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :platforms
  end
end
