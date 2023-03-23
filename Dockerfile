FROM tomcat:9.0-alpine
COPY . /usr/local/tomcat/webapps/ROOT
WORKDIR /usr/local/tomcat/bin
RUN echo "#!/bin/sh" > startup.sh \
    && echo "chromium-browser --no-sandbox http://localhost:8080" >> startup.sh \
    && chmod +x startup.sh

EXPOSE 8080
CMD ["sh", "-c", "./startup.sh & catalina.sh run"]