require 'rails_helper'

feature "managing posts", type: :feature do
  feature "user visits posts index page" do
    background do
      Post.create!(title: "hello earth")
      Post.create!(title: "hello pluto")
    end
    scenario "they see list of existing posts" do
      visit root_path

      expect(page).to have_content "hello earth"
      expect(page).to have_content "hello pluto"
    end
  end

  feature "user creates a new post" do
    scenario "they can see the newly created post"
  end

  feature "user destroy a post" do
    scenario "they cannot see the destroyed post"
  end

  feature 'user updates a post' do
    scenario "they can see the updated post"
  end
end
