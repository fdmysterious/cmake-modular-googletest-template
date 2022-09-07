if [ -z $(docker image ls buildenv:componentTesting --format '1') ] ; then
	echo "Build docker image for componentTesting"
	docker build -t buildenv:componentTesting -f docker/Dockerfile_componentTesting docker
fi

mkdir -p build-tests
mkdir -p logs
docker run \
	--mount type=bind,src="$(pwd)/scripts",target="/scripts" \
	--mount type=bind,src="$(pwd)",target="/project" \
	buildenv:componentTesting /bin/ash -c "cd /project && /scripts/run_tests.sh"
