
require('sinatra')
require('sinatra/reloader')
require('./lib/parcels')
require('pry')
also_reload('lib/**/*.rb')
get('/') do
  @parcels = Parcels.all

  erb(:parcels)

end
get('/parcels') do

end

get('/parcels/new') do
erb(:new_parcels)
end

get('/parcels/:id') do
  @parcels = Parcels.find(params[:id].to_i())
  erb(:parcel)
end

post('/parcels') do
  side_a = params[:side_a].to_i
  side_b = params[:side_b].to_i
  side_c = params[:side_c].to_i
  weight = params[:weight].to_i
  ship = params[:ship]
  parcels = Parcels.new(nil, side_a,side_b,side_c, weight, ship)
  parcels.save()
  @parcels = Parcels.all
  erb(:parcels)

end

get('/parcels/:id/edit') do
  @parcels = Parcels.find(params[:id].to_i())
  erb(:edit_parcels)
end

patch('/parcels/:id') do

end

delete('/parcels/:id') do

end

get('/custom_route') do

end
