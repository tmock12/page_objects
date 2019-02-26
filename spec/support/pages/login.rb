
module Pages
  class Login
    include Capybara::DSL

    def has_title?
      has_selector?('.auth-title', text: 'Salut!')
    end
  end
end
