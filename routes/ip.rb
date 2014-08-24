  get "/" do
    format_response(IP.all, request.accept)
  end

  get "/ip" do
    format_response(IP.all, request.accept)
  end
  
  get "/ip/:id" do
    ip ||= IP.get(params[:id]) || halt(404)
    format_response(ip, request.accept)
  end
  
  get "/ip/:id/public" do
   ip ||= IP.all(:fields => [:public_ip]) || halt(404)
    format_response(ip, request.accept)
  end

  get "/ip/:id/private" do
    ip ||= IP.all(:fields => [:private_ip]) || halt(404)
    format_response(ip, request.accept)
  end

  post "/ip" do
    body = JSON.parse request.body.read
    ip = IP.create(
      private_ip: body['private'],
      public_ip: body['public'],
      created_at: Time.now,
      updated_at: Time.now
  )
  status 201
  format_response(ip, request.accept)
  end
   
  delete '/ip/:id' do
    ip ||= IP.get(params[:id]) || halt(404)
    halt 500 unless ip.destroy
  end 
