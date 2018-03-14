feature ' testing links can be deleted' do
  scenario 'user wants to delete a link' do
    visit('/')
    fill_in 'delete_title', with: 'Google'
    click_button 'Delete'
    expect(page).not_to have_content ('Google')
  end
end
