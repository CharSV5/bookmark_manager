feature 'testing links can be viewed' do
  scenario 'when requested by user, display inks' do
    visit '/'
    click_lick 'View'
    expect(page).to have_content 'www.makersacademy.com'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.twitter.com'
  end
end
