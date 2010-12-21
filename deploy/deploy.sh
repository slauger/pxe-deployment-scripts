#!/usr/bin/env bash
cd `dirname "$0"`
if [ "$1" != "--all" ] && [ ! -f "exec/deploy_$1.sh" ]; then
	echo "Error: deployment script not found"
	exit 1
fi
source ./config.sh
if [ "$1" == "--all" ]; then
	for i in exec/*.sh; do
		echo "runing $i..."
		sh "$i"
	done
else
	sh "exec/deploy_$1.sh"
fi
exit 0
