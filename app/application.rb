class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []
    @@item = Item.new(:name, :price)

    if req.path.match(/items/)
      if @@items.include?(@@item)
        resp.write "#{@@item.price}"
      elsif !@@items.include?(@@item)
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
