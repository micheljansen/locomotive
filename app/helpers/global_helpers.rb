module Merb
  module GlobalHelpers
    # helpers defined here available to all views.

    def menu_link(name, url)
      if url.kind_of?(Symbol)
        link_to(name, resource(url))
      else
        link_to(name, url)
      end
    end

    def paginate_links(current_page, page_count, resource_name)
      links = ""
      unless page_count.nil? || page_count <= 1
        1.upto(page_count) do |page|
          if (current_page || 1).to_i == page
            links << " #{page}"
          else
            links << " " << link_to(page, resource(resource_name, :page => page))
          end
        end
      end
      links
    end

  end
end
