require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before(:all) do
    @chef = Chef.create!(name: "Chef Boyardee")
    @dish = @chef.dishes.create!(name: "Pasta Carbonara", description: "Spaghetti with guanciale, egg yolks, and Pecorino Romano cheese.")
    @ingredient1 = @dish.ingredients.create!(name: "Spaghetti", calories: 221)
    @ingredient2 = @dish.ingredients.create!(name: "Guanciale", calories: 165)
    @ingredient3 = @dish.ingredients.create!(name: "Egg Yolks", calories: 55)
    @ingredient4 = @dish.ingredients.create!(name: "Pecorino Romano", calories: 119)
  end

  it "Displays a list of ingredients for that dish and the chef's name" do
    visit "/dishes/#{@dish.id}"
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient4.name)
    expect(page).to have_content("Cooked by #{@chef.name}")
  end

  it "Displays the total calorie count for that dish" do
    visit "/dishes/#{@dish.id}"
    expect(page).to have_content("Total calorie count: #{@dish.total_calories}")
  end
end
