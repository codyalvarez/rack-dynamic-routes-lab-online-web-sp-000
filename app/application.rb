class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []

    if req.path.match(/items/)
      if @@items.include?(@@item)
        resp.write "#{@@item.price}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
     resp.finish
  end
end

#   if req.path.match(/items/)
#     @@items.each do |item|
#       resp.write "#{item.price}"
#     end
#   elsif req.path.match(/search/)
#
#       search_term = req.params["q"]
#
#     elsif @@items.include?(search_term)
#       resp.write "#{search_term}"
#     elsif @@items.include?!(search_term)
#       resp.write "Route not found"
#       resp.status 404
#     else
#       resp.write "Route not found"
#       resp.status 400
#     end
#
#     resp.finish
#   end
# end
