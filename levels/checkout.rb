difficulty 2
# description "Create and switch to a new branch called my_branch. You will need to create a branch like you did in the previous level."
text = <<~TEXT
  Erstellen Sie einen neuen Branch namens 'my_branch' und wechseln Sie
  zu diesem. Sie müssen einen Branch erstellen, wie Sie es im vorherigen
  Level getan haben.

  Hinweis:
  Zum wechseln eines Branches gibt es zwei Befehle:
  `git checkout` und `git switch`
TEXT
description text

setup do
  repo.init
  FileUtils.touch("README")
  repo.add("README")
  repo.commit_all("Initial commit")
end

solution do
  return false unless repo.head.name == "my_branch"
  true
end

hint do
  # puts "Try looking up `git checkout` and `git branch`."
  puts "Versuchen Sie es mit `git branch` und `git checkout` oder `git switch`."
end
