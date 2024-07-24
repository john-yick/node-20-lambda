# Define custom function directory
FROM node:20-alpine
ARG FUNCTION_DIR

# Install aws-lambda-cpp build dependencies
RUN apt-get update && \
    apt-get install -y \
    g++ \
    make \
    cmake \
    unzip \
    libcurl4-openssl-dev

# Copy function code
RUN mkdir -p ${FUNCTION_DIR}
COPY myFunction/* ${FUNCTION_DIR}

WORKDIR ${FUNCTION_DIR}

# Install the function's dependencies which can be overwritten
RUN npm init -y

# Lambda runtime
RUN npm install aws-lambda-ric

