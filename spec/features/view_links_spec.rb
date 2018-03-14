feature 'testing links can be viewed' do
  scenario 'when requested by user, display inks' do
    visit '/'
    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Twitter'
  end
end
