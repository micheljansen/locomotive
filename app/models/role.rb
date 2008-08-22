# == Schema Information
# Schema version: 20080821134651
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)     
#  created_at :datetime        
#  updated_at :datetime        
#

class Role < ActiveRecord::Base
  has_many :purposes, :dependent => :destroy
  has_many :servers, :through => :purposes
end
