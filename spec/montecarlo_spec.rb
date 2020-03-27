RSpec.describe Montecarlo do
  it "has a version number" do
    expect(Montecarlo::VERSION).not_to be nil
  end

  it "calculates π" do
  	mc = Montecarlo::Pi.new 
  	res = mc.calculate
    expect(res.to_s).to include('3.1')
  end
end
