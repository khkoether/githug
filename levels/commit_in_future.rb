# require 'time'
require 'date'

difficulty 2
# description "Commit your changes with the future date (e.g. tomorrow)."
text = <<~TEXT
  Speichern Sie Ihre Änderungen mit einem zukünftigen Datum (z.B. morgen).
TEXT
description text

setup do
  repo.init

  FileUtils.touch("README")
  repo.add("README")
end

solution do
  repo.commits(repo.head.name).length == 1 &&
  repo.commits(repo.head.name).first.authored_date > Time.now
end

hint do
  # puts "Build a time format, and commit your code using --date parameter for \"future\"."
  datum = Date.today + 1
  puts "Erstellen Sie einen Commit z.B. mit dem Parameter '--date #{datum}'."
end
