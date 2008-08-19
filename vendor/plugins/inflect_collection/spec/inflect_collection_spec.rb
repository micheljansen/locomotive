require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../init.rb'

class Person
end

class TestObject
end

class ActiveRecordCategory
  cattr_accessor :count
end

describe InflectCollection do
  it "should singularize a collection of one" do
    [Person.new].inflected.should == "person"
    [TestObject.new].inflected.should == "test object"
  end
  
  it "should pluralize a collection of more than one" do
    [Person.new, Person.new].inflected.should == "people"
    [TestObject.new, TestObject.new].inflected.should == "test objects"
  end
  
  it "should singularize a single object" do
    Person.new.inflected.should == "person"
    TestObject.new.inflected.should == "test object"
  end
  
  it "should singularize a class object" do
    Person.inflected.should == "person"
    TestObject.inflected.should == "test object"
  end
  
  it "should pluralize ActiveRecord-like classes" do
    ActiveRecordCategory.count = 0
    ActiveRecordCategory.inflected.should == "active record categories"
    
    ActiveRecordCategory.count = 1
    ActiveRecordCategory.inflected.should == "active record category"
    
    ActiveRecordCategory.count = 2
    ActiveRecordCategory.inflected.should == "active record categories"
  end
  
  #it "should pluralize an empty collection" do 
  #end
  
end