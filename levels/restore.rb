difficulty 4
# description "You decided to delete your latest commit by running `git reset --hard HEAD^` (not a smart thing to do). Now you changed your mind and want that commit back. Restore the deleted commit."
text = <<~TEXT
  Sie haben sich entschlossen, Ihren letzten Commit zu löschen, indem
  Sie `git reset --hard HEAD^` ausgeführt haben (keine kluge Entscheidung).
  Jetzt haben Sie es sich anders überlegt und wollen diesen Commit zurück.
  Stellen Sie den gelöschten Commit wieder her.
TEXT
description text

setup do
  repo.init
  FileUtils.touch 'file1'
  repo.add        'file1'
  # repo.commit_all 'Initial commit'
  repo.commit_all 'Erster Commit'

  FileUtils.touch 'file2'
  repo.add        'file2'
  # repo.commit_all 'First commit'
  repo.commit_all 'Zweiter Commit'

  FileUtils.touch 'file3'
  repo.add        'file3'
  # repo.commit_all 'Restore this commit'
  repo.commit_all 'Restore diesen Commit'

  repo.git.native :reset, { "hard" => true }, 'HEAD^'
end

solution do
  return false unless File.exists?('file3')
  true
end

hint do
  # puts "The commit is still floating around somewhere. Have you checked out `git reflog`?"
  puts "Der Commit ist immer noch irgendwo im Umlauf. \nHaben Sie `git reflog` bereits ausprobiert?"
end
