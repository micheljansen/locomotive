# InflectCollection
module InflectCollection
  
  # return a correctly inflected string for this Object
  def inflected
    if(self.respond_to?(:count))
      # things like rails ActiveRecord objects
      if self.count == 0 then
        return self.name.underscore.gsub(/_/, " ").downcase.pluralize
      elsif self.count == 1 then
        return self.name.underscore.gsub(/_/, " ").downcase.singularize
      else
        return self.name.underscore.gsub(/_/, " ").downcase.pluralize
      end
      
    elsif(self.respond_to?(:size))
      
      if self.size == 0 then
        # special case, we don't know the type!
        "none"
      elsif self.size == 1 then
        self[0].class.name.underscore.gsub(/_/, " ").downcase.singularize
      else
        self[0].class.name.underscore.gsub(/_/, " ").downcase.pluralize        
      end
      
    elsif(self.is_a?(Class))
      # for classes, use the class name in singular form
      self.name.underscore.gsub(/_/, " ").downcase.singularize
    else
      # for all other objects, use the class name in singular form
      self.class.name.underscore.gsub(/_/, " ").downcase.singularize
    end
    
  end
  
end