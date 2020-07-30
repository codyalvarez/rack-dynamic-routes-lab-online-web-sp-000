class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []
    @@item = Item.new(:name, :price)
    @@items << @@item

    if req.path.match(/items/) && @@items.include?(@@item)
      # if @@items.include?(@@item)
        resp.write "#{@@item.price}"\
      elsif @@items.include?!(@@item)
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "Route not found"
        resp.status = 404
      end
    # end
    resp.finish
  end
end
