feature 'adding a new link' do
  scenario 'a user can add a link' do
    visit('/new-link')
    fill_in('url', with: 'http://testlink.com')
    click_button('Submit')
    expect(page).to have_content 'http://testlink.com'
  end
end
