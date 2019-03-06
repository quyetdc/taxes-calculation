# FloatRound module
# To round the tax up to the nearest 0.05
module FloatRound
  def self.round(float)
    (float * 20.0).ceil / 20.0
  end
end
