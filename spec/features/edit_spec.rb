feature 'testing links can be edited' do
  scenario 'user wants to change title Google to Google Home Page' do
    visit '/'
     within '#link-1' do
       click_button 'Edit'
     end
     fill_in 'edit_title', with: 'Google Home Page'
     click_button 'Submit'
    expect(page).to have_content 'Google Home Page'
  end
end
