feature ' testing links can be deleted' do
  scenario 'user wants to delete a link' do
    visit('/')
    within '#link-2' do
      click_button 'Delete'
    end
    expect(current_path).to eq '/'
    expect(page).not_to have_content ('Google')
  end
end
