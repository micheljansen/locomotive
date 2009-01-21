# == Schema Information
# Schema version: 20081201121936
#
# Table name: purposes
#
#  id         :integer         not null, primary key
#  role_id    :integer
#  server_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Purpose
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :role_id, Integer
  property :server_id, Integer
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :role
  belongs_to :server

  validates_is_unique :role_id, :scope => :server_id,
                          :message => "already assigned to this server."
end
