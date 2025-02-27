# Install Operating system and dependencies
FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apk update && apk add --no-cache curl git wget bash unzip gdb libstdc++ gcompat glu python3 font-noto && rm -rf /var/cache/apk/*

ENV DEBIAN_FRONTEND=dialog
ENV PUB_HOSTED_URL=https://pub.flutter-io.cn
ENV FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor

# Enable flutter web
RUN flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/

RUN flutter build web --dart-define-from-file=development.env

# EXPOSE <EXPOSE PORT THAT YOU WANT>
EXPOSE 9000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]