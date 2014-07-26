#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os, sys
import sqlite3
import csv

if len(sys.argv) > 1:
    input_file = sys.argv[1]
else:
    input_file = "spell_full.csv"

DB_NAME = 'spells.db'
TABLE_NAME = 'spells'

FIELD_TYPES = {
    'id': 'int primary_key'
}

with open(input_file) as ifile:
    reader = csv.reader(ifile)

    headers = next(reader)

    with sqlite3.connect(DB_NAME) as con:
        con.text_factory = str
        cur = con.cursor()

        # May as well enable it now, in case we use it in future
        cur.execute("PRAGMA foreign_keys = ON;")

        # Drop any existing stale/failed copy
        cur.execute("DROP TABLE {0};".format(TABLE_NAME))

        # Give default types for unspecified headers
        for field in headers:
            if not field in FIELD_TYPES:
                FIELD_TYPES[field] = 'TEXT'

        # Create the table with the headers as columns
        data_list = [" ".join(f) for f in FIELD_TYPES.items()]
        table_cmd = "CREATE TABLE {name} ({data});".format(
            name=TABLE_NAME, data=",\n".join(data_list))
        print(table_cmd)
        cur.execute(table_cmd)

        row_cmd = "INSERT INTO {name} ({columns}) VALUES ({placeholders});".format(
            name=TABLE_NAME,
            placeholders= ", ".join(['?'] * len(headers)),
            columns=",".join(headers))

        for row in reader:
            #TODO: handle special cases like nulls here
            cur.execute(row_cmd, row)
