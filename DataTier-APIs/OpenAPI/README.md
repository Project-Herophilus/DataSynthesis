### Description
A project for building an OpenAPI specification and generating servers or clients from that spec.

### VSCode Setup
* (Open the working directory at the OPENAPI folder for the linter to work correctly)
* Add Redocly OpenAPI extension to VSCode as well to handle the multifile support

### Structure

The Root API definition is `./openapi-spec.yaml`.

Generally this is the hierarchy of object references:
* The root api will point to Operations
* Operations will take in parameters
* Operations will also reference responses
* Both parameters and responses will reference schema objects
* Schema objects can reference each other

### Install
`npm install`

# Bundle
`npm run bundle-api`

# Build
Build Clients or Servers. Check out script names in the `./package.json`.

# Helpful global install
`npm install -g @redocly/openapi-cli@latest`

# References

* [OpenAPI-CLI](https://github.com/Redocly/openapi-cli)
* [OpenAPIGenerator](https://openapi-generator.tech/)
* [VSCode Extension](https://marketplace.visualstudio.com/items?itemName=Redocly.openapi-vs-code)

# Mind dump notes while developing
* openapi-cli is beta...with all the risks of using an early tool. It gives nice structure but the final generated spec will be a fall back of any issues.
    * Structure heavily influenced by [Blog Post by David Garcia](https://davidgarcia.dev/posts/how-to-split-open-api-spec-into-multiple-files/)
* Running into issues with just using Apicurito and I didnt like not being able to split up the definitions.
* Swagger editor can be used online but change the port to 3002
* Making edits in a giant yaml is painful.
* Might look into having each group of APIs have its own root for paths to then bundle together into a single file
* CaSinG is all over the place. Expect a refactor with.  Cases arnt even consistent let alone correct.
* I used both postman and swagger editor on local to validate some requests. I have not used any of the generated clients just yet.