feature 'adding a new link' do
  scenario 'a user can add a link' do
    visit('/new-link')
    fill_in('url', with: 'http://testlink.com')
    fill_in('title', with: 'test')
    click_button('Submit')
    expect(page).to have_content 'test'
  end
  scenario 'a user caoont add an incorrect link' do
    visit '/new-link'
    fill_in('url', with: 'not a link')
    click_button('Submit')
    expect(page).to have_content 'That is not a valid url'
    expect(page).not_to have_content 'not a link'
  end
end
