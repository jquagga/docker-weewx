FROM ghcr.io/mamba-org/micromamba:latest@sha256:50059aba474d4ae0265187cc7f5ea28c32f1164ec7d487f256664bace8b7e4d3

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml
COPY --chown=$MAMBA_USER:$MAMBA_USER requirements.txt /tmp/requirements.txt
RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]