feature "Logged in user" do

  def register_user(username, password)
    visit "/"

    click_link "Register"

    fill_in "Username", with: username
    fill_in "Password", with: password

    click_button "Register"
  end

  before(:each) do
    register_user("Fred", "abcd")
  end

  scenario "can do lots of stuff!" do
    visit "/"

    register_user("hoonta", "t0psecret")

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "t0psecret"

    click_button "Sign In"

    within ".user-list" do
      expect(page).to have_no_content "hoonta"
      expect(page).to have_content "Fred"

      click_button "Delete"
    end

    within ".user-list" do
      expect(page).to have_no_content "Fred"
    end
  end
end
