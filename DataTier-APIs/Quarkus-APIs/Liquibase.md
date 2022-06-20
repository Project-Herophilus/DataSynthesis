# Supporting Technologies

## Liquibase
    [Liquibase](https://www.liquibase.com/) is used to help track, version and deploy database schema changes.  
We are utilizing the [liquibase maven plugin](https://docs.liquibase.com/tools-integrations/maven/home.html) to simplify the use of liquibase.

    **NOTE:  Do NOT edit any database tables directly or any changesets already defined.  The app will fail to start if any changes are made outside of liquibase or any changes are made to an already deployed changset.**

### Diff
You can diff 2 databases and have liquibase generate a file with the differences.  Follow these basic steps to perform a diff.
1.  Deploy current code into a database
-  This can be done by using docker-compose
2.  Deploy current code into another database
3.  Make changes to second database (i.e. add columns, indexes, etc.)
4.  Run diff (see example below) command against both databases
5.  Copy everything after the first line `databaseChangeLog:` in the specified `diffChangeLogFile` and paste it into the `changeLog-master.yaml` file.
6.  Make necessary changes to hibernate classes
7.  Re-run docker-compose to install new changes
- Login to database and very changes are there
8.  Run the tests to ensure everything is valid

A sample diff command:
    ```
mvn liquibase:diff \
-Dliquibase.referenceUrl="jdbc:mysql:<IP OR HOSTNAME>:<PORT>/<databasename>" \
-Dliquibase.referenceUsername=<USERNAME> \
-Dliquibase.referencePassword=<PASSWORD> \
-Dliquibase.referenceDriver=com.mysql.cj.jdbc.Driver \
-Dliquibase.diffChangeLogFile=src/main/resources/liquibase-diffChangeLog.yaml
```
The differences will be placed in the `src/main/resources/liquibase-diffChangeLog.yaml` file.
    NOTE:  by default the original/old database will utilized the properties in the [pom.xml](pom.xml) file (properties: driver, url, username, password).
To override this add those parameters on the command line above and don't forget to prefix them with `-Dliquibase.`

### Useful Diff links
- [Maven Liquibase Plugin diff](https://docs.liquibase.com/tools-integrations/maven/commands/maven-diff.html)
