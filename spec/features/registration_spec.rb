require "spec_helper"

feature "Registration and authentication" do
  scenario "A user logs in" do
    visit "/"

    click_link "Register"

    expect(page).to have_content "Register"
  end
end
