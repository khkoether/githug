difficulty 2

description "You have created too many branches for your project. There is an old branch in your repo called 'delete_me', you should delete it."
text = <<~TEXT
  Sie haben zu viele Branche für Ihr Projekt erstellt. In Ihrem
  lokalen Repository gibt es einen alten Branch namens 'delete_me'.
  Löschen Sie den Branch.
TEXT
description text

setup do
    init_from_level
end

solution do
  return true unless repo.branches.map(&:name).include?('delete_me')
end

hint do
  # puts "Running 'git --help branch' will give you a list of branch commands."
  puts "Schauen Sie sich `git help branch` an."
end
