class Application

  @@cart = []

  @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if @@cart.empty?
      resp.write "Your cart is empty"
    end
    if req.path.match(/cart/)
      @@cart.each do |cart|
        resp.write "#{cart}\n"
      end

    else req.path.match(/add/)
      search_term = req.params["item"]

      if @@items.include?(search_term)
         @@cart << search_term
         resp.write"added #{search_term}"
      else
        resp.write "We don't have that item"
      end
    # else
    #   resp.write "Your cart is empty"
    end

    resp.finish
  end

  # def handle_search(search_term)
  #   if @@items.include?(search_term)
  #     @@cart << search_term
  #   end
  #     return "We don't have that item"
  #   end
  end
