require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Albert") }
  let(:choco_cake) { Dessert.new("cake", 9, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(choco_cake.type).to eq("cake") 
    end

    it "sets a quantity" do
      expect(choco_cake.quantity).to eq(9)
    end

    it "starts ingredients as an empty array" do
      expect(choco_cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("cake", "A lot", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      choco_cake.add_ingredient("chocolate")
      expect(choco_cake.ingredients).to eq(["chocolate"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "sugar", "milk", "eggs"]
      ingredients.each do |ingredient|
        choco_cake.add_ingredient(ingredient)
      end

      choco_cake.mix!
      expect(choco_cake.ingredients).to_not eq(ingredients)

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      choco_cake.eat(3)
      expect(choco_cake.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { choco_cake.eat(10) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Albert the Great Baker")
      expect(choco_cake.serve).to eq("Chef Albert the Great Baker has made 9 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(choco_cake)
      choco_cake.make_more
    end
  end
end
