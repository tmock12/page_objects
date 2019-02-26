require 'spec_helper'

RSpec.describe 'Customer adds product to supermarket list', type: :feature, js: true do
  scenario 'with an existing account' do
    product = double(
      :product,
      name: 'Cafea boabe Gran Aroma 1kg Lavazza',
      price: '11299 Lei'
    )
    visit product_path(product)

    expect(page).to have_selector('.page-title', text: product.name)
    expect(page).to have_selector(
      '.product-new-price-offer',
      text: product.price
    )

    within('.product-page-actions') do
      click_button('Lista Supermarket')
    end

    expect(page).to have_selector('.auth-title', text: 'Salut!')
    fill_in('Introdu adresa de email', with: 'coolio@example.com')
    click_button('Continua')

    expect(page).to have_field(
      'username',
      with: 'coolio@example.com',
      readonly: true
    )

    fill_in('Introdu parola contului tau eMAG', with: 'superSecret123')
    click_button('Continua')

    expect(page).to have_text('Produsul a fost adaugat in lista')
    within('.product-page-actions') do
      expect(page).to have_button('Elimina din lista')
    end
  end
end
