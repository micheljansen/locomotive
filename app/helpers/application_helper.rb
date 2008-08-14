# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def new_release_path_for(service_id)
    "/releases/new?service_id=#{service_id}"
  end
end
