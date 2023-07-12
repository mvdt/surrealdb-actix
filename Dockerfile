FROM docker/whalesay:latest

RUN apt-get -y update
RUN curl --proto '=https' --tlsv1.2 -sSf https://install.surrealdb.com | sh
RUN surreal start --log trace --user $DATABASE_USER --pass $DATABASE_PASS --bind 0.0.0.0:$DATABASE_PORT memory