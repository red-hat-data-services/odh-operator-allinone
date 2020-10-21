ARG operator_ver=v0.8.0
ARG manifest_ver=v0.8.0
ARG operator_base=quay.io/opendatahub/opendatahub-operator
ARG manifest_url=https://github.com/red-hat-data-services/odh-manifests

FROM ${operator_base}:${operator_ver}
ARG manifest_ver
ARG manifest_url
RUN curl -L ${manifest_url}/tarball/${manifest_ver} -o /opt/manifests/${manifest_ver}.tar.gz --create-dirs && \
    ln -s /opt/manifests/${manifest_ver}.tar.gz /opt/manifests/odh-manifests.tar.gz
