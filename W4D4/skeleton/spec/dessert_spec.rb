require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:brownie) { Dessert.new("brownie", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end
    it "sets a quantity" do
      expect(brownie.quantity) to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons", chef) }.to raise_error(ArgumentError)
    end
  end
  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("monkfruit")
      expect(brownie.ingredients).to include("monkfruit")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "butter", "monkfruit", "egg"]
      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end
      expect(brownie.ingredients).no_to eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(1)
      expect(brownie.quantity).to eq(9)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(11) }.to raise_error("not enough")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      expect(brownie.serve).to eq("Chef Tucker the Great Baker has made 10 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
