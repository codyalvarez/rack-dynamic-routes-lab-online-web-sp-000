class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # returns 404 for a bad route
    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}"
      elsif req.path.match(/search/)

        search_term = req.params["q"]

      if @@items.include?(search_term)
        resp.write "#{search_term}"
      else
        resp.write "Route not found"
        resp.route 400
      end

      resp.finish
    end
  end




end
