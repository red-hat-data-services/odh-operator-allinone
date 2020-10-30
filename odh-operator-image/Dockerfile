ARG operator_ver=0.1.0
ARG manifest_ver=v0.8.0
ARG operator_base=quay.io/modh/opendatahub-operator
ARG manifest_url=https://github.com/red-hat-data-services/odh-manifests

FROM ${operator_base}:${operator_ver}
ARG manifest_ver
ARG manifest_url
USER root
RUN curl -L ${manifest_url}/tarball/${manifest_ver} -o /opt/manifests/${manifest_ver}.tar.gz --create-dirs && \
    ln -s /opt/manifests/${manifest_ver}.tar.gz /opt/manifests/odh-manifests.tar.gz && \
    chown 1001:0 /opt/manifests &&\
    chmod -R a+r /opt/manifests

USER 1001
