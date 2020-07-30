require "pry"
class Application
  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    item = req.path.split("/items/").last

    if req.path.match(/items/)
      #binding.pry
      if @@items.include?(item)
        binding.pry
        resp.write "#{item.price}"
      else
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
