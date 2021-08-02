require 'pry'
class Application


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/owners/) && req.post?
      data = JSON.parse(req.body.read) #code to unpackage the stringifiy JSON
      userExists = Owner.find_by(username: data["username"]) #check if user xitst with that username? usernames must be uniq
      if userExists
        return [200, { 'Content-Type' => 'application/json' }, [ {:error => "User with username: #{userExists.username} already exists"}.to_json ]]   
      else
        owner = Owner.create(data)
        return [200, {'Content-Type' => 'application/json'}, [{
          :message => "You successfullly signed up for Vehicle Maintenance App",
          :owner => owner
          }.to_json]]
      end

    elsif req.path.match(/owners/)
      # binding.pry
      username = req.params["q"]
      owner = Owner.find_by(:username => username)
      return [200, { "Content-Type" => "application/json" }, [{:owner => owner, :ownerVehicles => owner.vehicles}.to_json]]

    elsif req.path.match(/vehicles/)
      vehicles = Vehicle.all
      return [200, { "Content-Type" => "application/json" }, [{:vehicles => vehicles}.to_json]]

    elsif req.delete?
      id = req.path.split("/vehicles/").last
      Vehicle.find(id).delete
      return [200, {'Content-Type' => 'application/json'}, [{:message => "You successfullly signed up for Vehicle Maintenance App",}.to_json]]
    elsif req.path.match(/vehicles/) && req.post?
      data = JSON.parse(req.body.read)
      vehicleExists = Vehicle.find_by(vin: data["vin"])
      
      if vehicleExists
        return [200, { 'Content-Type' => 'application/json' }, [ {:error => "Vehilce with vin: #{vehicleExists.vin} already exists"}.to_json ]] 
      else
        vehicle = Vehicle.create(data)
        # binding.pry
        return [200, {'Content-Type' => 'application/json'}, [{
          :message => "You successfullly created a vehicle profile",
          :vehicle => vehicle
          }.to_json]]
      end
    
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

end
