require "spec_helper"

feature "Registration and authentication" do
  scenario "A user logs in" do
    visit "/"

    click_link "Register"

    click_button "Register"

    expect(page).to have_content "Username is required"
    expect(page).to have_content "Password is required"

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "t0p"
    click_button "Register"

    expect(page).to have_content "Password must be at least 4 characters"

    fill_in "Username", with: "hoonta"
    fill_in "Password", with: "t0psecret"
    click_button "Register"

    expect(page).to have_content "Thanks for registering"
  end
end
