difficulty 3
# description "Your new feature isn't worth the time and you're going to delete it. But it has one commit that fills in `README` file, and you want this commit to be on the master as well."
text = <<~TEXT
  Der Branch 'new_feature' ist die Zeit nicht wert und Sie werden ihn löschen.
  Aber es gibt einen Commit, der die Datei 'README' füllt, und Sie wollen,
  dass dieser Commit auch auf dem 'master'-Branch ist.
TEXT
description text

setup do
    init_from_level
    `git stash` # fix for README.md being in githug root an the level
end

solution do
  return false unless repo.commits[1].message == "Added fancy branded output"
  return false unless repo.commits[0].message == "Filled in README.md with proper input"
  true
end

hint do
  # puts "Sneak a peek at the `git help cherry-pick` command."
  puts "Werfen Sie einen Blick auf den Befehl `git help cherry-pick`."
end
