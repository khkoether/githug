difficulty 3
# description "Correct the typo in the message of your first (non-root) commit."
text = <<~TEXT
  Korrigieren Sie den Tippfehler in der Commit-Message
  im ersten (non-root) Commit.
TEXT
description text

setup do
  repo.init
  FileUtils.touch "README"
  repo.add        "README"
  repo.commit_all "Initial commit"

  FileUtils.touch "file1"
  repo.add        "file1"
  repo.commit_all "First coommit"

  FileUtils.touch "file2"
  repo.add        "file2"
  repo.commit_all "Second commit"
end

solution do
  repo.commits(repo.head.name).first.parents[0].message == "First commit"
end

hint do
  # puts "Take a look the `-i` flag of the rebase command."
  puts "Schauen Sie sich die Option '-i' des Befehls 'git rebase' an."
end
