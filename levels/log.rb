difficulty 2

# description "Find out what the hash of the latest commit is."
text = <<~TEXT
  Finden Sie heraus, wie der Hash des letzten Commits lautet.
TEXT
description text

setup do
  repo.init
  file = File.new("newfile.rb", "w")
  repo.add("newfile.rb")
  # repo.commit_all("THIS IS THE COMMIT YOU ARE LOOKING FOR!")
  repo.commit_all("DIES IST DER COMMIT, DEN SIE SUCHEN")
end

solution do
  # repo.commits.last.id_abbrev == request("What is the hash of the most recent commit?")[0..6]
  repo.commits(repo.head.name).last.id_abbrev == request("Wie lautet der Hash des letzten Commits?")[0..6]
end

hint do
  # puts "You need to investigate the logs. There is probably a command for doing that!"
  puts "Sie müssen die Protokolle untersuchen. \nWahrscheinlich gibt es dafür einen Befehl!"
end
