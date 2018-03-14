require 'pg'

class DatabaseConnection

  def self.setup(dbname, pg = PG)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
