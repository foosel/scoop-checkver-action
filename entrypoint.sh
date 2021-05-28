#!/bin/sh -l

BUCKET=$1
APPS=$2
UPGRADE='-u'
FORCE=''

[ -n "$APPS" ] || APPS='*'
[ -n "$3" ] && UPGRADE=''
[ -n "$4" ] && FORCE='-f'

echo "Running checkver..."
echo "  APPS:    $APPS"
echo "  UPGRADE: $UPGRADE"
echo "  FORCE:   $FORCE"
echo ""
echo "Bucket:"
echo `ls /github/workspace/$BUCKET`
echo ""

pwsh /scoop/apps/scoop/current/bin/checkver.ps1 -a "$APPS" -d /github/workspace/$BUCKET $UPGRADE $FORCE
