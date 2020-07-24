require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before(:all) do
    @chef = Chef.create!(name: "Chef Boyardee")
    @dish1 = @chef.dishes.create!(name: "Pasta Carbonara", description: "Spaghetti with guanciale, egg yolks, and Pecorino Romano cheese.")
    @ingredient1 = @dish1.ingredients.create!(name: "Spaghetti", calories: 221)
    @ingredient2 = @dish1.ingredients.create!(name: "Guanciale", calories: 165)
    @ingredient3 = @dish1.ingredients.create!(name: "Egg Yolks", calories: 55)
    @ingredient4 = @dish1.ingredients.create!(name: "Pecorino Romano", calories: 119)
    @dish2 = @chef.dishes.create!(name: "Creamy Tortellini", description: "Cheesy pasta with spinach and tomato.")
    @ingredient5 = @dish2.ingredients.create!(name: "Tortellini", calories: 249)
    @ingredient6 = @dish2.ingredients.create!(name: "Spinach", calories: 23)
    @ingredient7 = @dish2.ingredients.create!(name: "Tomato", calories: 33)
    @ingredient8 = @dish2.ingredients.create!(name: "Pecorino Romano", calories: 119)
  end

  it "Displays chef's name, a link to view all of the ingredients the chef uses in their dishes" do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content(@chef.name)
    click_link "View Chef's Ingredients"
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient4.name)
    expect(page).to have_content(@ingredient5.name)
    expect(page).to have_content(@ingredient6.name)
    expect(page).to have_content(@ingredient7.name)
    expect(page).to have_content(@ingredient8.name)
  end
end
