difficulty 2
# description "We have a file in the branch 'feature'; Let's merge it to the master branch."
text = <<~TEXT
  Wir haben eine Datei im Branch 'feature';
  führen Sie sie bitte mit dem 'master'-Branch zusammen.
TEXT
description text

setup do
	init_from_level
end

solution do
	return false unless repo.commits.length == 2
	File.exists?("file1")	&& File.exists?("file2")
end

hint do
  # puts "You want to research the `git merge` command."
	puts "Schauen Sie sich `git help merge` an."
end
