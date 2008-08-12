class Menu
  
  def self.root
    @menu ||= Menu.new
  end
  
  def self.[](key)
    root[key]
  end
  
  def self.[]=(key, value)
    root[key] = value
  end
  
  def [](key)
    items[key]
  end
  
  def []=(key, value)
    items[key] = value
  end
  
  def items
    @items ||= {}
  end
  
  def add(*args)
    key = args.first
    previous_items = [items[key]]
    items[key] = [args]
  end
  
  def set(*args)
    key = args.first
    items[key] = [args]
  end
  
end