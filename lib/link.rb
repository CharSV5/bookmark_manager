require_relative 'database_connection'
require 'uri'

class Link
@@comments = []
attr_reader :id, :url, :title, :comments

  def initialize(id, url, title )
    @id = id
    @url = url
    @title = title
  end

def self.add_comment(id, text)
  DatabaseConnection.query("INSERT INTO comments (link_id, text) values(#{id},'#{text}')")
  @@comments.push(Comment.new(text))
end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| Link.new(link['id'], link['url'], link['title'])}
  end

  def self.create(url, title)
    return false unless is_url?(url)
    DatabaseConnection.query("INSERT INTO links (url, title) values('#{url}', '#{title}')")
    true
  end

  def self.delete(id)
    DatabaseConnection.query "DELETE FROM links WHERE id = '#{id}';"
  end

  def self.edit(id, url, title)
    p id, url, title
    return false unless is_url?(url)
    DatabaseConnection.query("UPDATE links SET url = '#{url}', title = '#{title}' WHERE id = '#{id}'")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM links WHERE id = '#{id}';")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }.first
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
