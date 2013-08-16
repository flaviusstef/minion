require 'spec_helper'

describe TasksController do
  it "Should be empty by default" do
    visit '/tasks'
    puts find('h2')
    expect(page).to have_content("yet")
  end

end
