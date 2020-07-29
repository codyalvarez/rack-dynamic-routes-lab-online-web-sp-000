class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # returns 404 for a bad route
    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item.price}"
      elsif req.path.match(/search/)

        search_term = req.params["q"]

      if @@items.include?(search_term)
        resp.write "#{search_term}"
      elsif @@items.include?!(search_term)
        resp.write "Route not found"
        resp.status 404
      else
        resp.write "Route not found"
        resp.status 400
      end

      resp.finish
    end
  end
end




