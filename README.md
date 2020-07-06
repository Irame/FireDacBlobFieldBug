### This repository contains a minimal example to showcase a bug in FireDac.

The bug causes a ```TFDQuery``` which is connected to a ```TDBGrid``` via a ```TDataSource``` to seemingly have more records than it actually has.
The number of records the query pretends to have depend on the number of rows that fit into the grid.

The steps to reproduce this error are the following:
1. Setup a normal ```TFDConnection```.
2. Setup a ```TDBGrid``` and connect it via a ```TDataSource``` to a ```TFDQuery```.
3. Set the ```SQL``` of the query to select at least one blob or memo field.
4. Set the ```FetchOptions.Items``` of the query to so it doesn't include ```fiBlobs```.
5. Add a calculated Field to the query.
6. Add a ```OnCalcFields``` handler to the query and read the selected blob or memo field (e.g. ```DataSet.FieldByName('Memo').AsString```).
7. Open the query.