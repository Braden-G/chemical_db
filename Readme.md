## Chemical Database 

### Project Summary
This project is to create a framework for a database to store chemical data. Three collections were created to give an example and show the use case of the database. A vector representation field was created but manually assigned, Mongodb Atlas has more advanced tooling for vector queries that would allow similar searches. The database provides an easy way to store chemical data and query by different properties to get valuable information about the different compounds. Becuase it is NoSQL databse the json documents can be vary for the different types of molecules being stored. This provides the flexibility to store a more wide range of useful information and correlate it easily.

### How to run
All the needed files are included. The startup script is in powershell so it needs to be ran on a windows machine. The script will create a docker container and upload the documents to create the chemicals_db. It then opens the mongo command line in the database. The queries.js file has five example queries that showcase potential use cases of the database. 
