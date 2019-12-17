
class Parcels
  attr_reader :id, :height, :width, :length, :weight, :volume, :ship
  @@parcels = {}
  @@total_rows = 0

  def initialize(id, height, width, length, weight, ship)
    @id = id || @@total_rows += 1
    @height = height
    @width = width
    @length = length
    @weight = weight
    @ship = ship
  end

  def save
    @@parcels[self.id] = Parcels.new(self.id, self.height, self.width, self.length, self.weight, self.ship)
  end

  def self.all
    @@parcels.values()
  end

  def ==(other_parcel)
    self.height.eql?(other_parcel.height) && self.width.eql?(other_parcel.width) && self.length.eql?(other_parcel.length) && self.weight.eql?(other_parcel.weight)&&
    self.ship.eql?(other_parcel.ship)
  end
  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end
  def self.find(id)
    @@parcels[id]
  end
  def update(height, width,legth, weight, ship)
    @height = height
    @width = width
    @length = length
    @weight = weight
    @ship = ship
  end
  def delete
    @@parcels.delete(self.id)
  end

  def volume
    self.height * self.width * self.length
  end

  def cost
    if self.ship == "standard"
      self.volume * self.weight / 4
    elsif self.ship == "priority"
      self.volume * self.weight / 2
    else self.volume * self.weight

    end

  end

end
