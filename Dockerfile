FROM ghcr.io/mamba-org/micromamba:latest@sha256:0d1b4789ca6835e0c9d0b65194735053388555a76afc92c7abace8725119c665

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml
COPY --chown=$MAMBA_USER:$MAMBA_USER requirements.txt /tmp/requirements.txt
RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]