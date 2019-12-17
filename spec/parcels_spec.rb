require('rspec')
require('parcels')

describe(Parcels) do
  before(:each) do
    Parcels.clear()
  end
  describe('.all') do
    it('returns an empty arry when there are no parcels') do
      expect(Parcels.all).to(eq([]))
    end
  end
  describe('#save') do
    it("saves an parcel") do
      parcel = Parcels.new(nil, 4,4,4,10,"standard") # nil added as second argument
      parcel.save()
      parcel2 = Parcels.new(nil, 6,6,6,12,"standard") # nil added as second argument
      parcel2.save()
      expect(Parcels.all).to(eq([parcel, parcel2]))
    end
  end
  describe('#==') do
    it("is the same parcel if it has the same attributes as another parcel") do
      parcel = Parcels.new(nil, 4,4,4,10,"standard")
      parcel2 = Parcels.new(nil, 4,4,4,10,"standard")
      expect(parcel).to(eq(parcel2))
    end
  end
  describe('.clear') do
    it("clears all parcels") do
      parcel = Parcels.new(nil, 4,4,4,10,"standard")
      parcel.save()
      parcel2 = Parcels.new(nil, 6,6,6,12,"standard")
      parcel2.save()
      Parcels.clear()
      expect(Parcels.all).to(eq([]))
    end
  end
  describe('.find') do
    it("finds an album by id") do
      parcel = Parcels.new(nil, 4,4,4,10,"standard")
      parcel.save()
      parcel2 = Parcels.new(nil, 6,6,6,12,"standard")
      parcel2.save()
      expect(Parcels.find(parcel.id)).to(eq(parcel))
    end
  end
  describe('#update') do
    it("updates an parcel by id") do
      parcel = Parcels.new(nil, 4,4,4,10,"standard")
      parcel.save()
      parcel.update(5,5,5,15,"standard")
      expect(parcel.height).to(eq(5))
    end
  end
  describe('#delete') do
    it("deletes an parcel by id") do
      parcel = Parcels.new(nil, 4,4,4,10,"standard")
      parcel.save()
      parcel2 = Parcels.new(nil, 6,6,6,12,"standard")
      parcel2.save()
      parcel.delete()
      expect(Parcels.all).to(eq([parcel2]))
    end
  end
  describe('#volume') do
    it("should calculate the volume of the parcel") do
      parcel = Parcels.new(nil, 4,4,4,10,"standard")
      parcel.save()
      expect(parcel.volume).to(eq(64))
    end
  end
  describe('#cost') do
    it("should calculate the shipping cost based on speed of shipping and volume and weight") do
      parcel = Parcels.new(nil, 4,4,4,10, "overnight")
      parcel.save()
      expect(parcel.cost).to(eq(640))
    end
  end
end
