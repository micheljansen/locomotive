class CreateReleaseVersions < ActiveRecord::Migration
  def self.up
    create_table :release_versions do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :release_versions
  end
end
