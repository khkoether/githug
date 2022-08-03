difficulty 2

# description "You need to fix a bug in the version 1.2 of your app. Checkout the tag `v1.2` (Note: There is also a branch named `v1.2`)."
text = <<~TEXT
  Sie müssen einen Fehler in der Version 1.2 Ihrer Anwendung beheben.
  Checken Sie den Tag 'v1.2' aus.

  Hinweis:
  Es gibt auch einen Branch 'v1.2'.
TEXT
description text

setup do
  repo.init
  branch_name = repo.head.name

  FileUtils.touch("app.rb")
  repo.add("app.rb")
  repo.commit_all("Initial commit")

  `echo "Some code" >> app.rb`
  repo.add("app.rb")
  repo.commit_all("Some changes")
  repo.git.tag( { 'f' => true }, "v1.0" )

  `echo "Buggy code" >> app.rb`
  repo.add("app.rb")
  repo.commit_all("Some more changes")
  repo.git.tag( { 'f' => true }, "v1.2" )

  `echo "More code" >> app.rb`
  repo.add("app.rb")
  repo.commit_all("Yet more changes")

  `echo "Some more code" >> app.rb`
  repo.add("app.rb")
  repo.commit_all("Changes galore")
  repo.git.tag( { 'f' => true }, "v1.5" )

  repo.git.native :checkout, {"b" => true}, 'v1.2'
  File.open("file3", 'w') { |f| f << "some feature\n" }
  repo.add "file3"
  repo.commit_all "Developing new features"

  # repo.git.native :checkout, {}, 'master'
  repo.git.native :checkout, {}, branch_name
end

solution do
  # return false unless repo.commits(branch_name).length == 5
  return false unless `git show HEAD --format=%s` =~ /Some more changes/
  true
end

hint do
  # puts "You should think about specifying you're after the tag named `v1.2` (think `tags/`)."
  puts "Sie sollten sich berücksichtigen, dass Sie nach dem Tag \nmit dem Namen 'v1.2' suchen (denken Sie an 'tags/')."
end
