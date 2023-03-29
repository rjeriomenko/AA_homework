require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef Bill the Great Baker") }
  subject(:dessert) { Dessert.new("cake", 1, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq "cake"
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq 1
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq []
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pineapple", "mango", chef) }.to raise_error ArgumentError
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("chocolate")
      expect(dessert.ingredients).to eq ["chocolate"]
    end
  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to receive :shuffle!
      dessert.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat 1
      expect(dessert.quantity).to eq 0
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat 2 }.to raise_error RuntimeError
    end
  end

  describe "#serve" do
    subject(:bill_dessert) { Dessert.new("baklava", 10, chef) }
      it "contains the titleized version of the chef's name" do
        expect(bill_dessert.serve).to eq "Chef Bill the Great Baker has made 10 baklavas!"
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive :bake
      dessert.make_more
    end
  end
end