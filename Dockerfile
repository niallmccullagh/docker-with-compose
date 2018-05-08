FROM docker:stable

ENV DOCKER_COMPOSE_VERSION=1.21.0

RUN set -ex; \
	apk add --no-cache --virtual .fetch-deps \
		curl \
	; \
	\
	if ! curl -L --fail https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/run.sh -o /usr/local/bin/docker-compose; then \
		echo >&2 "error: failed to download 'docker-compose-${DOCKER_COMPOSE_VERSION}'"; \
		exit 1; \
	fi; \
	\
    chmod +x /usr/local/bin/docker-compose; \
    \
	apk del .fetch-deps
