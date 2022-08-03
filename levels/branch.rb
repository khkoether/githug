difficulty 1
# description "You want to work on a piece of code that has the potential to break things, create the branch test_code."
text = <<~TEXT
  Wenn Sie an einem Teil des Codes arbeiten wollen, der möglicherweise
  etwas kaputt macht, erstellen Sie z.B. den Branch 'test_code'.
TEXT
description text

setup do
  repo.init
  FileUtils.touch("README")
  repo.add "README"
  repo.commit_all("Initial commit")
end

solution do
  repo.branches.map(&:name).include?("test_code")
end

hint do
  # puts "`git branch` is what you want to investigate."
  puts "Schauen Sie sich `git branch` an."
end
