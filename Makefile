postgres:
	docker run --name postgres13 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:13.21-alpine

createdb: 
	docker exec -it postgres13 createdb -U root --owner=root simple_bank

dropdb:
	docker exec -it postgres13 dropdb -U root simple_bank

migrate-up:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" up

migrate-down:
	migrate -path db/migrations -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" down

setup-db: postgres createdb migrate-up

sqlc:
	sqlc generate

test:
	go test -v -cover ./... 

.PHONY: setup-db sqlc
# This Makefile is used to manage the PostgreSQL database for the simple_bank application.
# It provides commands to create and drop the database.
# The database is run in a Docker container named "postgres13" with the default PostgreSQL user "root" and password secret.
# The database is created with the owner "root" and the name "simple_bank".
# The commands can be run from the command line using "make createdb" or "make dropdb".
# The PostgreSQL server is exposed on port 5432.
# The PostgreSQL image used is version 13.21-alpine.
# The PostgreSQL server is exposed on port 5432.					