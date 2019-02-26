
module Pages
  class Login
    include Capybara::DSL

    def current_page?
      has_selector?('.auth-title', text: 'Salut!')
    end

    def fill_in_email(email)
      fill_in('Introdu adresa de email', with: email)
    end

    def fill_in_password(password)
      fill_in('Introdu parola contului tau eMAG', with: password)
    end

    def click_continue
      click_button('Continua')
    end

    def has_username?(username)
      has_field?(
        'username',
        with: username,
        readonly: true
      )
    end
  end
end
