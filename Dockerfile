FROM docker:18.09.6

RUN apk add --no-cache \
		py-pip \
	&& pip install docker-compose==1.24.0
