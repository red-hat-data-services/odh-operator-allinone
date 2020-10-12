ARG version=v0.8.0
FROM quay.io/opendatahub/opendatahub-operator:${version}
ARG version

RUN curl -L https://github.com/red-hat-data-services/odh-manifests/tarball/${version} -o /opt/manifests/${version}.tar.gz --create-dirs && \
    ln -s /opt/manifests/${version}.tar.gz /opt/manifests/odh-manifests.tar.gz
