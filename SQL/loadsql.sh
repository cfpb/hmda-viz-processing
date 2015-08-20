#! /bin/bash

service postgresql-9.3 start && /bin/su postgres -c "psql -d hmda -1 -f cbsa2010.sql;" && service postgresql-9.3 stop
service postgresql-9.3 start && /bin/su postgres -c "psql -d hmda -f testfile.sql;" && service postgresql-9.3 stop
