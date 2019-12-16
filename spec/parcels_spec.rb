
    require('rspec')
    require('parcels')

    describe(Parcels) do
    describe('#save') do
      it('test') do
        test = Parcels.new()
        expect(test.save()).to(eq('test'))
      end
    end
  end
  