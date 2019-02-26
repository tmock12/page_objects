require "support/path_helper"

module Pages
  class Product
    include Capybara::DSL
    # include Rails.application.routes.url_helpers

    def initialize(product)
      @product = product
    end

    def visit_page
      visit product_path(@product)
    end

    def current_page?
      has_selector?('.page-title', text: @product.name)
    end

    def click_add_to_shopping_list
      product_actions.click_button('Lista Supermarket')
    end

    def has_product_price?
      has_selector?(
        '.product-new-price-offer',
        text: "#{@product.price.to_s.delete('.')} Lei"
      )
    end

    def has_added_to_list_confirmation_message?
      has_text?('Produsul a fost adaugat in lista')
    end

    def has_added_to_list_button?
      product_actions.has_button?('Elimina din lista')
    end

    private

    def product_actions
      find('.product-page-actions')
    end
  end
end
