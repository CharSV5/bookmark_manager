require 'link'

describe Link do
  describe '#all' do
    it 'returns all links in an array' do
    links = Link.all
    expect(links[0].url).to include('http://www.makersacademy.com')
    expect(links[1].url).to include('http://www.google.com')
    expect(links[2].url).to include('http://www.twitter.com')
  end

    it 'returns the ids' do
      links = Link.all
      expect(links[0].id).to eq '1'
      expect(links[1].id).to eq '2'
      expect(links[2].id).to eq '3'
    end
  end
  describe '#create' do
    it 'creates a new link' do
      Rake::Task[:reset_table].execute
      Link.create('http://www.testlink.com', 'Title')
      expect(Link.all[0].url).to eq 'http://www.testlink.com'
    end
  end
  it 'does not create a new link if the url is not valid' do
    Link.create('not a link', 'not a link')
    expect(Link.all).not_to include 'not a link'
  end
end
