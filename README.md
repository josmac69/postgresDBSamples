# PostgreSQL Database Samples

copy of https://www.postgresql.org/ftp/projects/pgFoundry/dbsamples/

A collection of sample databases for PostgreSQL.

* Adventureworks - OLTP database for a fictitious, multinational manufacturing company called Adventure Works Cycles
* Chinook - digital media store
* French Towns - all French towns and regions
* ISO-3166 - All countries and subcountries in the world
* Pagila - Movie rental database with actors, ratings, payments, etc.
* Role Based Access Control - authentication solution
* USDA - food database
* World - Cities, Countries, and what language they speak

## Other Resources

- http://www.databaseanswers.org/data_models/

## Usage

* All actions are done using make commands
  * build a project - `make build PROJECT=adventureworks`
  * start postgresql database - `make run-postgresql PROJECT=adventureworks`
    * this command starts a docker container with the database and exposes the port 5432 - container runs in the background
  * stop postgresql database - `make stop-postgresql PROJECT=adventureworks`
  * stop all running containers - `make stop-all`
* to access running PostgreSQL container and connect to the database use `make run-psql PROJECT=adventureworks`

