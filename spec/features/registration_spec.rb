require "spec_helper"

feature "Registration and authentication" do
  scenario "A user logs in" do
    visit "/"

    expect(page).to have_link "Register"
  end
end
