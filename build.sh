#!/bin/bash
docker build --build-arg tag=$1 -t djunoltd/install:$1 .
