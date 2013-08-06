require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "displays tasks" do
      Task.create!(:name => "paint fence")
      visit tasks_path
      page.should have_content("paint fence")
    end

    it "supports js", :js => true do
      visit tasks_path
      click_link "test js"
      page.should have_content("js work")
    end
  end

  describe "POST /tasks" do
    it "create task" do
      visit tasks_path
      fill_in "task_name", :with => "mow lawn"
      click_button "Add"
      save_and_open_page
      page.should have_content("Successfully added task.")
      page.should have_content("mow lawn")
    end
  end
end
