difficulty 4
# description "You have been working on a branch but got distracted by a major issue. Switch back to that branch even though you forgot the name of it."
text = <<~TEXT
  Sie haben an einem Branch gearbeitet, wurden aber durch ein
  wichtiges Problem abgelenkt. Wechseln Sie zurück zu diesem Branch,
  auch wenn Sie den Namen vergessen haben.
TEXT
description text

setup do
  init_from_level
end

solution do
  return false unless repo.head.name == "solve_world_hunger"
  true
end

hint do
  # puts "Ever played with the `git reflog` command?"
  puts "Vor Jahren wäre `git reflog` der richtige Ansatz gewesen. \nSpäter hat der Befehl `git checkout` eine weitere Option erhalten. \nUnd seit Git v2.23 gibt es auch `git switch` mit entsprechender Option."
end
