# ChangeLog
Alle nennenswerten Änderungen an diesem Projekt werden in dieser Datei dokumentiert.

Das Format basiert auf [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
und dieses Projekt hält sich an die [Semantische Versionierung](https://semver.org/spec/v2.0.0.html).

Bis _August 2021_ wurden die Commits (alle Änderungen) in zeitlicher
Reihenfolge (gekürzt) in der Datei _ApplicationInfos_ gesammelt.  
Die Alt-Daten wurden übernommen und werden ausschließlich hier weitergeführt.

Ein **ChangeLog soll** aber gerade **die beachtentswerten Änderungen** zwischen
den Veröffentlichungen (Versionen) **sichtbar machen**.&nbsp;  
Wobei Änderungen der selben Art **in Bereiche gruppiert** werden.

ChangeLog: Bereiche
- **Added** für neue Features.
- **Changed** für Änderungen an der bestehenden Funktionalität.
- **Deprecated** für Features, die in zukünftigen Versionen entfernt werden.
- **Removed** für Deprecated-Features, die in dieser Version entfernt wurden.
- **Fixed** für alle Bug-Fixes.
- **Security** um Benutzer im Fall von geschlossenen Sicherheitslücken  
  zu einer Aktualisierung aufzufordern.

Commit: \<Type>(\Scope): \<Subject>
Der \<Type> beschreibt die Art der Veränderung.
- feat (feature)
- fix (bug fix)
- docs (documentation)
- style (formatting, missing semi colons, …)
- refactor
- test (when adding missing tests)
- chore (maintain)
- build (configuration, tools)
- jruby, protocol (brakeman, rspec, rubocop)

Der \<Scope> kann alles sein, was den Ort der Veränderung angibt.

> Githug-de **0.6.x** &ndash; **2022-07-..** &nbsp;&nbsp; bis &nbsp;&nbsp;
  Githug **0.5.0** &ndash; **2016-11-13** / **2022-03-21**


## [Unreleased]

### Changed
- Change the program name: githug -> githug-de
- German translation of the program output
- German translation of level 00-20  
  nil, init, config, add, commit, clone,  
  clone_to_folder, ignore, include, status, number_of_files_committed,  
  rm, rm_cached, stash, rename, restructure,  
  log, tag, push_tags, commit_amend, commit_in_future

## 2022-07-30
- feat: German translation of level 00-20

## 2022-07-28
- build: Change the program name
- feat: German translation of the program output
