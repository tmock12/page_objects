require 'spec_helper'

RSpec.describe 'Customer adds product to supermarket list', type: :feature, js: true do
  scenario 'with an existing account' do
    email = ENV.fetch('TEST_EMAIL')
    password = ENV.fetch('TEST_PASSWORD')
    product = double(
      :product,
      name: 'Cafea boabe Gran Aroma 1kg Lavazza',
      price: 112.99
    )

    product_page = Pages::Product.new(product)
    product_page.visit_page
    expect(product_page).to be_current_page
    expect(product_page).to have_product_price
    product_page.click_add_to_shopping_list

    login_page = Pages::Login.new
    expect(login_page).to be_current_page
    login_page.fill_in_email(email)
    login_page.click_continue

    expect(login_page).to have_username(email)
    login_page.fill_in_password(password)
    login_page.click_continue

    expect(product_page).to be_current_page
    expect(product_page).to have_added_to_list_confirmation_message
    expect(product_page).to have_added_to_list_button
  end
end
