yes | docker system prune -a
docker volume ls | awk '{print $2}' | tail -n +2  | xargs -I % sh -c 'docker volume rm %'
