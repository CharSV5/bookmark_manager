feature 'testing comments' do
  scenario 'a user can leave a comment' do
    visit '/'
    within '#link-1' do
      click_button "Comment"
      fill_in 'comment', with: 'Makers is awesome!'
      click_button 'Submit'
      expect(page).to have_content 'Makers is awesome!'
    end
  end
end
