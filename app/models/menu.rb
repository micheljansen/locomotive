class Menu
  
  def initialize
    @order = []
  end
  
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
  
  # value is wrapped in an array if required
  def []=(key, value)
    @order << key
    items[key] = value
  end
  
  def items
    @items ||= {}
  end
  
  # get all the links for this menu, in the order they were added
  # If a link named "Dashboard" exists, it always gets precedence
  def links
    @order.inject([]) do |set, key|
       if(key == "Dashboard") 
         [link_for(key)] + set
       else
        set << link_for(key)
      end
    end
  end
  
  # get the default link for this menu
  def default_link

    if items.empty? 
      return []
    elsif items.member?("Dashboard")
      return link_for("Dashboard")
    else
      return link_for(items.keys.first)
    end

  end
  
  def link_for(key)
    item = items[key]
    if item.is_a?(Menu) then
      submenu_link = item.default_link
      submenu_link[0] = key #replace the name
      return submenu_link
    elsif item.is_a?(Array)
      [key] + item
    else
      [key] + [item]
    end
  end
  
  # Set a menu, named by "key" and defined further in "args".
  # This accepts the same parameters as link_to
  # if "args" is empty, assume creation of a submenu
  # if a menu named "key" already exists, it is replaced
  def add(key, *args)
    @order << key
    if(args.size == 0) then
      items[key] = Menu.new
    else
      items[key] = args
    end
  end
  
  # resets this menu
  def self.reset
    @menu = Menu.new
  end
    
end