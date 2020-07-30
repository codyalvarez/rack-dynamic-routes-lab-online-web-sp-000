require "pry"
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []
    item = req.path.split("/items/").last

    if req.path.match(/items/)
      #binding.pry
      if @@items.include?(item)
        resp.write "#{item}"
      elsif !@@items.include?(item)
        resp.write "Item not found"
        resp.status = 400
      end
    else
        resp.write "Route not found"
        resp.status = 404
      end
    # end
    resp.finish
  end
end
