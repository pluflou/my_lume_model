FROM condaforge/mambaforge AS build

COPY environment.yml /my-lume-model/environment.yml

RUN apt-get update && \
    apt-get install -y gcc git build-essential

RUN mamba install -c conda-forge conda-pack && \
  mamba env create -f /my-lume-model/environment.yml

# Use conda-pack to create a  enviornment in /venv:
RUN conda-pack -n my-lume-model -o /tmp/env.tar && \
  mkdir /venv && cd /venv && tar xf /tmp/env.tar && \
  rm /tmp/env.tar

# No longer need conda, just the packed python
FROM debian:buster AS runtime

# provide version from Docker build args
ARG VERSION
ENV version=$VERSION

ENV PATH="${PATH}:/venv/bin"

# Copy /venv from the previous stage:
COPY --from=build /venv /venv
COPY . /my-lume-model

SHELL ["/bin/bash", "-c"] 
# Fix paths, will be same in final image so this is fine
RUN source /venv/bin/activate && \
    /venv/bin/conda-unpack

COPY _entrypoint.sh /usr/local/bin/_entrypoint.sh
COPY my_lume_model/flow.py /opt/prefect/flow.py

RUN chmod +x /usr/local/bin/_entrypoint.sh

RUN source /venv/bin/activate && \
  python -m pip install /my-lume-model

# When image is run, run the code with the environment
# activated:
SHELL ["/usr/local/bin/_entrypoint.sh", "/bin/bash", "-c"]

ENTRYPOINT ["/usr/local/bin/_entrypoint.sh"]