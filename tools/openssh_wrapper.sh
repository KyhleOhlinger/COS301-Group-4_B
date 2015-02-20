#!/bin/sh

# I would prefer to use SSH_ASKPASS to prompt for everyting, but OpenSSH on Windows
# absolutely refuses to prompt even if you set DISPLAY=none and don't redirect stdin
# Only option appears to be separation via cygwin setsid, but this needs
# extra binaries and means you can't track the call at all.
# This is the lesser of all evils. Discourage OpenSSH anyway.

# Disable password authentication since we can't intercept it reliably
# Only support keys. Also accept server keys (not ideal but we can't prompt either)
ssh -oPasswordAuthentication=no -oStrictHostKeyChecking=no $*