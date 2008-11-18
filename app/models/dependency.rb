class Dependency < ActiveRecord::Base
  belongs_to :service_type
  belongs_to :role
  
  validates_uniqueness_of :role_id, :scope => :service_type_id,
                          :message => "already assigned to this servicetype"
end
