#!/usr/bin/env bash
set -e

g='\033[0;32m'
r='\033[0;31m'
n='\033[0m'

# Example: only the stars/asterisks green
echo
echo -e "   __   __   __   ___ "
echo -e "  /  \` /  \ |  \ |__  "
echo -e "  \__, \__/ |__/ |___ "
echo -e "   __       ___       "
echo -e "  |__)  /\   |   |__|  "
echo -e "  |    /--\  |   |  |  "
echo -e "        __   __   ___  "
echo -e "  ${g}\|/  ${n}/  \ |__) / _   "
echo -e "  ${g}/|\  ${n}\__/ |  \ \__/  "
echo
echo -e "Welcome to the ${g}Password Security Lab${n} environment!"
echo
echo "GETTING STARTED:"
echo -e " ${g}*${n} John is already installed (use 'john' to run)."
echo -e " ${g}*${n} Provided files are in ~/ (use 'ls -l' to view)."
echo -e " ${g}*${n} Follow along with the instructions at:"
echo -e "\thttps://github.com/codepath/opencyber-password-lab"
echo

# Keep John's session files in the home volume, so cracked passwords
# (john.pot) and interrupted sessions (john.rec, for `john --restore`)
# survive a container restart. John writes them to /opt/john/run, which is
# outside the volume, so link each one to ~/.john. This runs on every start,
# so it also covers volumes created before this change.
mkdir -p "$HOME/.john"
for f in john.pot john.log john.rec; do
  ln -sfn "$HOME/.john/$f" "/opt/john/run/$f"
done

# Hand off to whatever the user specifies (default = bash)
status=0
"$@" || status=$?

# John deletes john.rec (here, the link) when a session finishes. If the link
# is gone, that session is done, so drop its saved copy too; otherwise a later
# `john --restore` would rerun a finished session.
if [ ! -L /opt/john/run/john.rec ]; then
  rm -f "$HOME/.john/john.rec"
fi
exit "$status"