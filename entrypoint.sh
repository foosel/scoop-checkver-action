#!/bin/sh -l

APPS=$1
UPGRADE='-u'
FORCE=''

[ -n "$APPS" ] || APPS='*'
[ -n "$2" ] && UPGRADE=''
[ -n "$3" ] && FORCE='-f'

echo "Running checkver..."
echo "  APPS:    $APPS"
echo "  UPGRADE: $UPGRADE"
echo "  FORCE:   $FORCE"
echo ""
echo "Bucket:"
echo `ls /bucket`
echo ""

pwsh /scoop/apps/scoop/current/bin/checkver.ps1 -a "$APPS" -d /bucket $UPGRADE $FORCE
