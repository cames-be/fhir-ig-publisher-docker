FROM ruby:3.2.0-bullseye

WORKDIR /app

# Install system components
RUN apt-get update && apt-get -y install build-essential zlib1g-dev jq nodejs openjdk-11-jdk npm

# Install Jekyll
RUN gem install bundler jekyll

# Install Sushi
RUN npm install -g fsh-sushi

ENV PATH="${PATH}:/usr/local/lib"

# Create the needed packages folder
RUN mkdir -p /root/.fhir/packages

# Keep the container running and don't exit
ENTRYPOINT ["tail", "-f", "/dev/null"]