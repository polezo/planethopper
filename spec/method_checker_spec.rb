
khaled = Player.find_or_create_by(name: "Khaled", life: 10, password: jimeny)
earth = Planet.find_or_create_by(name: "Earth",bad_scenario: "You've encountered a friggin shark with a laser!", good_scenario: "You found a box of chocolate! Your health is increased.")

describe 'Landing' do
    
    describe '#planet' do
      it 'has a planet' do
        this_landing = Landing.new(player: khaled, planet: earth)
        expect(this_landing).to respond_to(:planet)
      end
    end
  
      describe '#player' do
      it 'has a player' do
        this_landing = Landing.new(player: khaled, planet: earth)
        expect(this_landing).to respond_to(:player)
      end
    end

  end

  describe 'Player' do
   
    describe '#player' do
    it 'has a name' do
        expect(Player.find_by(name: [nil,""])).to be(nil)
    end
  end

    describe '#password' do
      it 'has a password' do
        expect(Player.find_by(password: [nil,""])).to be(nil)
      end
    end
  end


  describe 'Planet' do
   
    describe '#planet' do
    it 'has a name' do
        expect(Planet.find_by(name: [nil,""])).to be(nil)
    end
  end
end