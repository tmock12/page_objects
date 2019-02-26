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
    visit product_path(product)

    expect(page).to have_selector('.page-title', text: product.name)
    expect(page).to have_selector(
      '.product-new-price-offer',
      text: "#{product.price.to_s.delete('.')} Lei"
    )

    within('.product-page-actions') do
      click_button('Lista Supermarket')
    end

    expect(page).to have_selector('.auth-title', text: 'Salut!')
    fill_in('Introdu adresa de email', with: email)
    click_button('Continua')

    expect(page).to have_field(
      'username',
      with: email,
      readonly: true
    )

    fill_in('Introdu parola contului tau eMAG', with: password)
    click_button('Continua')

    expect(page).to have_text('Produsul a fost adaugat in lista')
    within('.product-page-actions') do
      expect(page).to have_button('Elimina din lista')
    end
  end
end
