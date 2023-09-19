#!/bin/bash

docker run --name bs_db -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=root -d postgres