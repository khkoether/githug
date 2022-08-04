difficulty 4
# description "You need to merge mybranch into the current branch (master). But there may be some incorrect changes in mybranch which may cause conflicts. Solve any merge-conflicts you come across and finish the merge."
text = <<~TEXT
  Sie müssen den Branch 'mybranch' mit dem aktuellen Branch 'master'
  zusammenführen. Es kann jedoch sein, dass es in 'mybranch' einige
  fehlerhafte Änderungen gibt, die Konflikte verursachen können.
  Lösen Sie alle Merge-Konflikte, auf die Sie stoßen, und schließen
  Sie das Merge ab.
TEXT
description text

setup do
  init_from_level
end

solution do
  solved = true

  solved = false unless repo.head.name == "master"
  solved = false unless repo.commits("master")[0].parents.length == 2

  txt = File.read("poem.txt")
  solved = false if txt =~ /[<>=|]/
  solved = false unless txt =~ /Sat on a wall/

  solved
end

hint do
  # puts ["First you have to do a merge. Then resolve any conflicts and finish the merge", "Take a look at the sections on merge conflicts in 'git merge'.", "Remove the unnecessary lines in `poem.txt`, so only the correct poem remains."]
  puts "Zuerst müssen Sie einen Merge durchführen. \nDann löse alle Konflikte und beende die Zusammenführung. \nSchau dir die Abschnitte über Zusammenführungskonflikte in `git help merge` an. \nEntferne die unnötigen Zeilen in 'poem.txt', \ndamit nur das richtige Gedicht übrig bleibt."
end
