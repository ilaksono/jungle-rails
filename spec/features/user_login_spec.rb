require 'rails_helper'

RSpec.feature "Login", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @user = User.create! name:'rspec test', email:'test@test.ca', password:'password'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "they log in" do
    # ACT
    visit root_path
    page.click_on 'Login'
    fill_in 'email', with: 'test@test.ca'
    fill_in 'password', with: 'password'
    click_on 'Submit'
    # DEBUG
    
    # VERIFY
    expect(page).to have_content 'Logout'
    save_screenshot
  end

end
