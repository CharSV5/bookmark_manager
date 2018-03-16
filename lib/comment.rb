class Comment
 attr_reader :text, :id

  def initialize(id, text)
    @id = id
    @text = text
  end

  def self.create (id, text)
    result = DatabaseConnection.query("INSERT INTO comments (link_id, text) VALUES(#{id}, '#{text}') RETURNING id, text")
    # confirm what RETURNING  does and why it is needed here. Does it turn it into an array?
    Comment.new(result[0][:id], result[0][:text])
  end
end
