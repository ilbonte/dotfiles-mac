git_main() {
  set -e

  git checkout main
  git pull
}

denter () {
	docker exec -it $1 /bin/bash
}