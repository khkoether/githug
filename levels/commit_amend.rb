difficulty 2
#description "The `README` file has been committed, but it looks like the file `forgotten_file.rb` was missing from the commit. Add the file and amend your previous commit to include it."
text = <<~TEXT
  Die Datei 'README' wurde erfolgreich in das lokale Repository übertragen.
  Aber es sieht so aus, als ob die Datei `forgotten_file.rb` im letzten
  Commit fehlt.
  Fügen Sie die Datei zum Staging-Bereich hinzu und ändern Sie Ihren
  letzten Commit so, dass beide Dateien im Commit enthalten sind.
TEXT
description text

setup do
  repo.init
  FileUtils.touch("README")
  repo.add("README")
  repo.commit_all("Initial commit")
  FileUtils.touch("forgotten_file.rb")
end

solution do
  # Reset config - see issue #74
  file = File.open(".git/config", "w") do |file|
    file.puts("[format]")
    file.puts(" pretty = medium")
  end
  repo.commits(repo.head.name).length == 1 &&
  Grit::CommitStats.find_all(repo, repo.commits(repo.head.name).first.sha).first[1].files.length == 2
end

hint do
  # puts "Running `git commit --help` will display the man page and possible flags."
  puts "Schauen Sie sich `git help commit` an."
end
