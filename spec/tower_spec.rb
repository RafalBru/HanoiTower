require 'rspec'
require_relative '../tower.rb'

describe Tower do
  describe '#initialize' do
    it "correct initialize" do
      tower = Tower.new(3)
      expect(tower.instance_variable_get(:@disks)).to be_an(Integer).and be > 2
    end
    it 'generate 3 towers: A, B and C' do
      tower = Tower.new(3)
      expect(tower.instance_variable_get(:@towers).keys).to contain_exactly("A","B","C")
    end
  end
  describe '#hanoi' do
    it 'generate solution of Hanoi Tower for 3 disks' do
      n = 3
      tower = Tower.new(n)
      tower.display
      tower.hanoi(n,'A','B','C')
      expect(tower.instance_variable_get(:@towers)["C"]).to contain_exactly(3,2,1) 
      expect(tower.instance_variable_get(:@count_move)).to eql(7)
    end
  end
end