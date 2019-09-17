FROM continuumio/miniconda3:4.6.14

MAINTAINER pughdr <david.pugh@kaust.edu.sa>

SHELL [ "/bin/bash", "-c" ]

# Create a non-root user
ARG username
ARG uid
ARG gid
ENV USER ${username}
ENV UID ${uid}
ENV GID ${gid}
ENV HOME /home/$USER

RUN adduser --disabled-password \
    --gecos "Non-root user" \
    --uid $UID \
    --gid $GID \
    --home $HOME \
    $USER

# want to create conda environment as non-root user 
USER ${USER}
RUN mkdir $HOME/app
WORKDIR $HOME/app

# build the specified conda environment from a file (defaults to 'environment.yml')
ARG environment
COPY --chown=$UID:$GID ${environment} /usr/tmp/environment.yml
RUN conda env create --prefix ./env --file /usr/tmp/environment.yml && \
    conda clean --all --force-pkgs-dir --yes && \
    conda init bash

# use an entrypoint script to insure conda environment is properly activated at runtime
ARG entrypoint
COPY --chown=$UID:$GID ${entrypoint} /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

# default command will be to launch JupyterLab server for development
EXPOSE 8888
CMD [ "jupyter", "lab", "--no-browser", "--ip", "0.0.0.0" ]
