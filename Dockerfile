ARG manifest_base=quay.io/modh/odh-manifests
ARG manifest_ver=0.1.0

ARG operator_base=quay.io/modh/opendatahub-operator
ARG operator_ver=0.1.0

FROM ${manifest_base}:${manifest_ver} as manifests
FROM ${operator_base}:${operator_ver}
USER root
COPY --from=manifests /opt/odh-manifests.tar.gz /opt/manifests/
RUN chown -R 1001:0 /opt/manifests &&\
    chmod -R a+r /opt/manifests
USER 1001
