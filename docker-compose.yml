version: '3'

services:
  myDB:
    image: postgres:15.3
    container_name: my-database
    restart: always
    ports:
      - 5432:5432
    environment:
      - POSTGRES_USER=alumno
      - POSTGRES_PASSWORD=123456
      - POSTGRES_DB=course-db
    volumes:
      - ./postgres:/var/lib/postgresql/data
  
  pdAdmin:
    image: dpage/pgadmin4
    container_name: pgadmin4
    restart: always
    depends_on:
      - myDB
    ports:
      - 8080:80
    environment:
      - PGADMIN_DEFAULT_EMAIL=alumno@google.com
      - PGADMIN_DEFAULT_PASSWORD=123456
    volumes:
      - ./pgadmin:/var/lib/pgadmin
      - ./pgadmin:/certs/server.cert
      - ./pgadmin:/certs/server.key
      - ./pgadmin:/pgadmin4/servers.json