#### Composite data
You can create composite data sets constructed from existing base data types. All the base data are randomly selected from database, but the composite data are not persisted. The API endpoint is
```
GET /api/data-structures?count=<number of records>&name=<name-of-data-structure>
```
Currently supported `name-of-data-structures` and their base types are:
* Person Demographics (Last Name, First Name)
* Bank Account (Bank Routing, Area Code)
* US Phone Number (Area Code, Phone Number)
* Complete Name (Last Name, First Name)
* US Address (Address, Zip Code)

Example output for query `http://localhost:8080/api/v1/data-structure?count=2&name=Complete%20Name`:
```
[{"lastName":"Simpson","firstName":"Jimmy","gender":"M"},
{"lastName":"Anderson","firstName":"Cathy","gender":"F"}]
```

