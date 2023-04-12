FROM node
RUN  useradd roboshop
RUN mkdir app
WORKDIR app
COPY server.js /app
COPY node_modules/ /app/node_modules
ADD https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem  /app/rds-combined-ca-bundle.pem
RUN chown roboshop:roboshop -R /app
USER roboshop
ENTRYPOINT ["node","server.js"]
