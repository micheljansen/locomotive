
module PlatformsHelper
  
  def unescaped_remote_function(options)
    javascript_options = options_for_ajax(options)

    update = ''
    if options[:update] && options[:update].is_a?(Hash)
      update  = []
      update << "success:'#{options[:update][:success]}'" if options[:update][:success]
      update << "failure:'#{options[:update][:failure]}'" if options[:update][:failure]
      update  = '{' + update.join(',') + '}'
    elsif options[:update]
      update << "'#{options[:update]}'"
    end

    function = update.empty? ?
      "new Ajax.Request(" :
      "new Ajax.Updater(#{update}, "

    url_options = options[:url]
    url_options = url_options.merge(:escape => false) if url_options.is_a?(Hash)
    function << "#{url_for(url_options)}"
    function << ", #{javascript_options})"

    function = "#{options[:before]}; #{function}" if options[:before]
    function = "#{function}; #{options[:after]}"  if options[:after]
    function = "if (#{options[:condition]}) { #{function}; }" if options[:condition]
    function = "if (confirm('#{escape_javascript(options[:confirm])}')) { #{function}; }" if options[:confirm]

    return function
  end
  
  def unescaped_drop_receiving_element(element_id, options = {})
    javascript_tag(unescaped_drop_receiving_element_js(element_id, options).chop!)
  end
  
  def unescaped_drop_receiving_element_js(element_id, options = {}) #:nodoc:
    options[:with]     ||= "'id=' + encodeURIComponent(element.id)"
    options[:onDrop]   ||= "function(element){" + unescaped_remote_function(options) + "}"
    options.delete_if { |key, value| ActionView::Helpers::PrototypeHelper::AJAX_OPTIONS.include?(key) }

    options[:accept] = array_or_string_for_javascript(options[:accept]) if options[:accept]    
    options[:hoverclass] = "'#{options[:hoverclass]}'" if options[:hoverclass]
    
    # Confirmation happens during the onDrop callback, so it can be removed from the options
    options.delete(:confirm) if options[:confirm]

    %(Droppables.add(#{element_id.to_json}, #{options_for_javascript(options)});)
  end
  
end
