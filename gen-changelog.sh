#!/bin/bash

# This CHANGELOG script was originally based of the work of Andrey Nikishaev and Gunnar Lindholm from this post:
# http://stackoverflow.com/questions/7387612/git-changelog-how-to-get-all-changes-up-to-a-specific-tag

# This script is geared towards OSX and you will need GTAC installed.
# `brew install coreutils`

# The placeholders are:

# %H: commit hash
# %h: abbreviated commit hash
# %T: tree hash
# %t: abbreviated tree hash
# %P: parent hashes
# %p: abbreviated parent hashes
# %an: author name
# %aN: author name (respecting .mailmap)
# %ae: author email
# %aE: author email (respecting .mailmap)
# %ad: author date (format respects --date= option)
# %aD: author date, RFC2822 style
# %ar: author date, relative
# %at: author date, UNIX timestamp
# %ai: author date, ISO 8601 format
# %cn: committer name
# %cN: committer name (respecting .mailmap)
# %ce: committer email
# %cE: committer email (respecting .mailmap)
# %cd: committer date
# %cD: committer date, RFC2822 style
# %cr: committer date, relative
# %ct: committer date, UNIX timestamp
# %ci: committer date, ISO 8601 format
# %d: ref names, like the --decorate option of git-log(1)
# %e: encoding
# %s: subject
# %f: sanitized subject line, suitable for a filename
# %b: body
# %B: raw body (unwrapped subject and body)
# %N: commit notes
# %gD: reflog selector, e.g., refs/stash@{1}
# %gd: shortened reflog selector, e.g., stash@{1}
# %gn: reflog identity name
# %gN: reflog identity name (respecting .mailmap)
# %ge: reflog identity email
# %gE: reflog identity email (respecting .mailmap)
# %gs: reflog subject

repo_url="http://github.com/kandanapp/kandan/commit/"

echo "CHANGELOG"
echo "========="
git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags |gtac |grep -v '^$' | while read TAG ; do
      echo
    if [ $NEXT ];then
        echo "#### [$NEXT]"
    else
    	echo "#### [Current]"
    fi
    GIT_PAGER=cat git log --pretty=format:" * [%h]($repo_url%h) %s __(%an)__" $TAG..$NEXT
    NEXT=$TAG
done
echo ""
FIRST=$(git tag -l | head -1)
echo ""

echo "#### [$FIRST]"

GIT_PAGER=cat git log --pretty=format:" * [%h]($repo_url%h) %s __(%an)__" $FIRST
