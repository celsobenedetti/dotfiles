# delete all docker volumes except the ones you select
function rm-docker-volumes () {

KEEP_VOLUMES=$(docker volume ls -q |
	fzf -m --preview 'docker volume inspect {}' --prompt "Select volumes to keep")

if [ -z "$KEEP_VOLUMES" ]; then
    echo "No volumes selected, exiting"
    return 0
fi

echo "Preserve volumes: $KEEP_VOLUMES"

echo "Are you sure you want to delete all other volumes? (y/n)"
read -r CONFIRM
if [ "$CONFIRM" != "y" ]; then
    echo "Exiting"
    return 0
else
    echo "Deleting volumes..."
fi

docker volume ls -q |
	tr -s ' ' |
	grep -v "$KEEP_VOLUMES" |
	xargs docker volume rm
}
