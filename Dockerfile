FROM hashicorp/packer:1.2.5
LABEL Author="Trent Scholl <me@trentscholl.com>"

RUN	apk --update add \
		bash \
		ca-certificates \
		git \
		less \
		openssl \
		openssh-client \
		p7zip \
		python \
		py-lxml \
		py-pip \
		rsync \
		sshpass \
		sudo \
		subversion \
		vim \
		zip \
    && apk --update add --virtual \
		build-dependencies \
		python-dev \
		libffi-dev \
		openssl-dev \
		build-base \
	&& pip install --upgrade \
		pip \
		cffi \
	&& pip install \
		ansible==2.5.5.0 \
		awscli==1.11.85 \
		boto==2.45.0 \
 		boto3==1.4.4 \
		docker-py==1.10.6 \
		dopy==0.3.7 \
		pywinrm>=0.1.1 \
		pyvmomi==6.0.0.2016.6 \
		pysphere>=0.1.7 \
	&& apk del build-dependencies \
	&& rm -rf /var/cache/apk/*

  ENTRYPOINT ["/opt/packer/bin/packer"]