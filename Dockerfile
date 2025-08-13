# Base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip git wget curl unzip \
    && apt-get clean

# Install Botpress
RUN wget https://github.com/botpress/botpress/releases/download/v12_39_1/botpress-v12_39_1-linux-x64.tar.gz \
    && tar -xzf botpress-v12_39_1-linux-x64.tar.gz -C /opt \
    && rm botpress-v12_39_1-linux-x64.tar.gz

# Set Botpress workdir
WORKDIR /opt/botpress

# Expose Botpress port
EXPOSE 3000

# Copy GPT4All model download script (if any)
COPY download_gpt4all.sh /opt/botpress/

# Install Python requirements for GPT4All
RUN pip3 install --no-cache-dir flask transformers sentencepiece

# Expose GPT4All API port
EXPOSE 5000

# Start Botpress and GPT4All API
CMD ["sh", "-c", "/opt/botpress/bp & python3 gpt4all_api.py"]