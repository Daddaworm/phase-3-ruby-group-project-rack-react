class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    elsif req.path.match(/owner/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Owner.all}.to_json ]]
    elsif req.path.match(/vehicle/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Vehicle.all}.to_json ]]
    elsif req.path.match(/routine/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Routine.all}.to_json ]]
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

end
