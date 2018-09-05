require 'pry'
class Owner
  # code goes here
  @@all = []

  attr_accessor :owner, :name, :pets
  attr_reader :species

  def initialize(species)
    @species = species
    @pets = ({:fishes => [], :dogs => [], :cats => []})
    @@all << self

  end

  def self.all
    @@all
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def buy_fish(fishname)
    new_fish = Fish.new(fishname)
    @pets[:fishes] << new_fish
  end

 def buy_cat(catname)
   new_cat = Cat.new(catname)
   @pets[:cats] << new_cat
 end

  def buy_dog(dogname)
    new_dog = Dog.new(dogname)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].each do |thedogs|
      thedogs.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |thecats|
      thecats.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |thefish|
      thefish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |type, moods|
      moods.each do |changemood|
      changemood.mood = "nervous"
      @pets = {}
      end
    end
  end

  def list_pets
    fishcount = @pets[:fishes].count
    # binding.pry
    dogcount = @pets[:dogs].count
    catcount = @pets[:cats].count
    return "I have #{fishcount} fish, #{dogcount} dog(s), and #{catcount} cat(s)."
  end
end
