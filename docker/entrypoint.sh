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

# Hand off to whatever the user specifies (default = bash)
exec "$@"