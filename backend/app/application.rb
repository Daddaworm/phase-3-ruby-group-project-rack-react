require 'pry'
class Application


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # if req.path.match(/test/) 
    #   return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    if req.path.match(/owners/) && req.post?
      data = JSON.parse(req.body.read) #code to unpackage the stringifiy JSON
      userExists = Owner.find_by(username: data["username"]) #check if user xitst with that username? usernames must be uniq
      if userExists
        return [200, { 'Content-Type' => 'application/json' }, [ {:error => "User with username: #{userExists.username} already exists"}.to_json ]]   
      else
        owner = Owner.create(data)
    
        # What do i want to send in response?
        return [200, {'Content-Type' => 'application/json'}, [{
          :message => "You successfullly signed up for Vehicle Maintenance App",
          :owner => owner
          }.to_json]]
      end

    elsif req.delete?
      # binding.pry

      id = req.path.split("/vehicles/").last
      Vehicle.find(id).delete
      return [200, {'Content-Type' => 'application/json'}, [{:message => "You successfullly signed up for Vehicle Maintenance App",}.to_json]]



    elsif req.path.match(/vehicles/)
      username = req.params["q"]
      user = User.find_by(:username => username)
      # return [200, { "Content-Type" => "application/json" }, [{ :data => {:user => user, :userContacts => user.contacts}}.to_json]]

      # return [200, { 'Content-Type' => 'application/json' }, [ {data: Vehicle.all}.to_json ]]
    elsif req.path.match(/routines/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Routine.all}.to_json ]]

    elsif req.path.match(/owners/)
      username = req.params["q"]
      owner = Owner.find_by(:username => username)
      return [200, { "Content-Type" => "application/json" }, [{:owner => owner, :ownerVehicles => owner.vehicles}.to_json]]
      # return [200, { 'Content-Type' => 'application/json' }, [ {data: Owner.all}.to_json ]]
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

end
