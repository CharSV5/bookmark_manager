require 'PG'

task :test_database_setup do
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE links;")

  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.twitter.com', 'Twitter');")
end

task :setup do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
  end
end

task :setup_table do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
connection = PG.connect(dbname: database)
connection.exec("CREATE TABLE IF NOT EXISTS links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
   end
end

task :drop_table do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
connection = PG.connect(dbname: database)
connection.exec('DROP TABLE "links";')
end
end

task :reset_table do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
connection = PG.connect(dbname: database)
connection.exec('TRUNCATE "links";')
end
end
