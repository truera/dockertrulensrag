FROM continuumio/miniconda3

WORKDIR /app

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# Activate the environment, and make sure it's activated:
RUN conda init
RUN echo "source activate trulens" > ~/.bashrc
ENV PATH /opt/conda/envs/trulens/bin:$PATH
# Install trulens_eval
ADD trulens /app/trulens
RUN pip install /app/trulens/trulens_eval

# Server config
ADD config.toml /root/.streamlit/config.toml

# Main script
COPY run.py .

ENTRYPOINT ["/opt/conda/envs/trulens/bin/python", "run.py"]
