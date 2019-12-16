require('sinatra')
    require('sinatra/reloader')
    require('./lib/parcels')
    also_reload('lib/**/*.rb')
    get('/') do

    end
    get('/parcels') do

    end

    get('/parcels/new') do

    end

    get('/parcels/:id') do

    end
    post('/parcels') do

    end

    get('/parcels/:id/edit') do

    end

    patch('/parcels/:id') do

    end

    delete('/parcels/:id') do

    end

    get('/custom_route') do

    end
    