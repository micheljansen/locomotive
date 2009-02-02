class MongrelRails < ServiceType
  def name
    "Ruby on Rails running on a Mongrel appserver"
  end

  depends_on "appserver"
end
