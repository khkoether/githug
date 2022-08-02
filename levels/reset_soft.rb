difficulty 2
# description "You committed too soon. Now you want to undo the last commit, while keeping the index."
text = <<~TEXT
  Sie haben den Commit zu früh ausgeführt. Jetzt wollen Sie den
  letzten Commit rückgängig machen, aber den Index beibehalten.
TEXT
description text

setup do
  repo.init
  FileUtils.touch("README")
  repo.add("README")
  # repo.commit_all("Initial commit")
  repo.commit_all("Initialer commit")
  FileUtils.touch("newfile.rb")
  repo.add("newfile.rb")
  # repo.commit_all("Premature commit")
  repo.commit_all("Verfrühter commit")
end

solution do
  return false unless File.exists?("newfile.rb") && repo.status.files.keys.include?("newfile.rb")
  return false if repo.status.files["newfile.rb"].untracked || repo.commits(repo.head.name).length > 1
  true
end

hint do
  # puts "What are some options you can use with `git reset`?"
  puts "Welche Kommando-Optionen können Sie mit `git reset` verwenden?"
end
