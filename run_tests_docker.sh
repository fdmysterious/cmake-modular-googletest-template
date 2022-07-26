mkdir -p build-tests
docker run \
	--mount type=bind,src="$(pwd)/build-tests",target="/build" \
	--mount type=bind,src="$(pwd)/cmake",target="/cmake" \
	--mount type=bind,src="$(pwd)/scripts",target="/scripts" \
	--mount type=bind,src="$(pwd)/src",target="/src" \
	buildenv:componentTesting /bin/ash -c "/scripts/run_tests.sh"
