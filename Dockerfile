FROM ghcr.io/mamba-org/micromamba:latest@sha256:66280bf29baae8297d690a96e9156630beb7cff01b3598c1c3145117746daa02

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml
COPY --chown=$MAMBA_USER:$MAMBA_USER requirements.txt /tmp/requirements.txt
RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]