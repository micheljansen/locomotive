class RenameFulfillmentsToPurposes < ActiveRecord::Migration
  def self.up
    rename_table :fulfillments, :purposes
  end

  def self.down
    rename_table :purposes, :fulfillments
  end
end
