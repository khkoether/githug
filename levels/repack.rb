difficulty 2
# description "Optimise how your repository is packaged ensuring that redundant packs are removed."
text = <<~TEXT
  Optimieren Sie die Paketierung Ihres Repositorys und stellen Sie
  sicher, dass überflüssige Pakete entfernt werden.
TEXT
description text

setup do
  repo.init
  FileUtils.touch("foo")
  repo.add("foo")
  repo.commit_all("Added foo")
end

solution do
  result = `git count-objects -v`
  required = ["count: 0", "prune-packable: 0"];
  required.all? { |r| result.include?(r) }
end

hint do
  # puts "You want to research the `git repack` command."
  puts "Schauen Sie sich `git help repack` an."
end
