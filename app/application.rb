require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      # binding.pry
      item = req.path.split("/items/").last
      x = 0
      @@items.each do |i|
        if i.name == item
          resp.write "#{i.price}"
          x = 1
        end
      end

      if x == 0
        resp.write "Item not found"
        resp.status = 400
      end

    else

      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
