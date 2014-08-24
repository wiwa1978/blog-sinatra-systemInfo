class IP
  include DataMapper::Resource  
  property :id,           Serial,	key: true, unique_index: true
  property :public_ip,    String,	length: 1..16
  property :private_ip,   String,	length: 1..16
  property :created_at,   DateTime
  property :updated_at,   DateTime
end