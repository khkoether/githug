difficulty 3
# description "Your local master branch has diverged from " +
#   "the remote origin/master branch. Rebase your branch onto " +
#   "origin/master and push it to remote."
text = <<~TEXT
  Ihr lokaler Branch 'master' weicht von dem Remote Branch
  'origin/master' ab. Führen Sie einen Rebase von ihrem
  Branch 'master' auf 'origin/master' durch und übertragen
  Sie das Ergebnis in das Remote Repository.
TEXT
description text

setup do
  # remember the working directory so we can come back to it later
  cwd = Dir.pwd
  # initialize another git repo to be used as a "remote"
  tmpdir = Dir.mktmpdir

  # local repo
  repo.init
  branch_name = repo.head.name
  if branch_name != "master"
    system("git branch -m #{branch_name} master")
  end

  FileUtils.touch "file1"
  repo.add        "file1"
  # repo.commit_all "First commit"
  repo.commit_all "Erster commit"

  FileUtils.touch "file2"
  repo.add        "file2"
  # repo.commit_all "Second commit"
  repo.commit_all "Zweiter commit"

  # copy the repo to remote
  FileUtils.cp "file1", tmpdir
  FileUtils.cp "file2", tmpdir

  # add another file
  FileUtils.touch "file3"
  repo.add        "file3"
  # repo.commit_all "Third commit"
  repo.commit_all "Dritter commit"

  # remote repo
  Dir.chdir tmpdir
  repo.init
  branch_name = repo.head.name
  if branch_name != "master"
    system("git branch -m #{branch_name} master")
  end  
  # make a 'non-bare' repo accept pushes
  `git config receive.denyCurrentBranch ignore`

  # add a different file and commit so remote and local would diverge
  FileUtils.touch "file4"
  repo.add        "file4"
  # repo.commit_all "Fourth commit"
  repo.commit_all "Vierter commit"

  # change back to original repo to set up a remote
  Dir.chdir cwd
  `git remote add origin #{tmpdir}/.git`
  `git fetch origin`
  `git branch -u origin/master master 2> /dev/null`
end

solution do
  repo.init
  result = true

  # Check the commits of the local branch and the branch are the same.
  local_commits = repo.commits("master")
  remote_commits = repo.commits("origin/master")
  result = false unless local_commits.size == 4
  local_commits.each_with_index do |commit, idx|
    result &&= (commit.id == remote_commits[idx].id)
  end

  result
end

hint do
  # puts "Take a look at `git fetch`, `git pull`, and `git push`."
  puts "Schauen Sie sich `git fetch`, `git pull` und `git push` an."
end
