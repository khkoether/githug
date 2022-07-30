difficulty 1
# description "The `README` file has been added to your staging area, now commit it."
text = <<~TEXT
  Die Datei 'README' wurde Ihrem Staging-Bereich hinzugefügt,
  tragen Sie nun die Änderungen in das Repository ein.
TEXT
description text

setup do
  repo.init
  FileUtils.touch("README")
  repo.add("README")
end

solution do
  return false if repo.commits(repo.head.name).empty?
  true
end

hint do
  # puts "You must include a message when you commit."
  puts "Sie müssen bei einem `git commit` eine Nachricht angeben."
end
