train:
	docker run --rm \
	--env-file .env \
	--runtime nvidia \
	--shm-size=16g \
	--mount type=bind,source="$(shell pwd)"/benchmark_data,target=/app/benchmark_data \
	--mount type=bind,source="$(shell pwd)"/results,target=/app/results \
	--mount type=bind,source="$(shell pwd)"/configs,target=/app/configs \
	$(IMG) $(ARG)

inspect:
	docker run -it \
	--env-file .env \
	--runtime nvidia \
	--shm-size=16g \
	--mount type=bind,source="$(shell pwd)"/benchmark_data,target=/app/benchmark_data \
	--mount type=bind,source="$(shell pwd)"/results,target=/app/results \
	--mount type=bind,source="$(shell pwd)"/configs,target=/app/configs \
	--entrypoint /bin/bash \
	$(IMG)

