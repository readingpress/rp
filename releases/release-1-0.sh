#!/bin/bash

# Get the start time.
RELEASE_START=$(date +%s)

# Used for file paths to scripts that need to run for this release.
RELEASE_TAG=`basename $0`
RELEASE_TAG="${RELEASE_TAG%.*}"

drush site-install standard --account-name=rp --account-pass=rp
drush vset site_name 'Reading Press' -y
drush vset site_mail 'noreply@readingpress.com' -y