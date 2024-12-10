# Define variables
$database = "chemical_db"
$collections = @("hydrocarbons", "metals", "elements")
$files = @("chemicals/hydrocarbons.json", "chemicals/metals.json", "chemicals/elements.json")
$container_path = "/tmp/chemicals" 
$container_name = "chemical_db_container"

# Start the MongoDB container
Write-Output "Starting MongoDB container..."
docker-compose up -d

# Wait for MongoDB to start
Write-Output "Waiting for MongoDB to start..."
Start-Sleep -Seconds 5

# Copy JSON files into the container
Write-Output "Copying JSON files into the container..."
docker exec $container_name mkdir -p $container_path  # Create the target directory inside the container
foreach ($file in $files) {
    Write-Output "Copying $file to container..."
    docker cp $file ${container_name}:${container_path}
}

# Upload JSON files to MongoDB
Write-Output "Uploading JSON files to MongoDB..."
for ($i = 0; $i -lt $collections.Length; $i++) {
    $collection = $collections[$i]
    $file = $files[$i]
    Write-Output "Importing $file into collection $collection..."

    docker exec -i chemical_db_container mongoimport --db $database --collection $collection --file "tmp/$file" --jsonArray
}

Write-Output "All files have been imported!"

Write-Output "Connecting to Chemicals database..."

docker exec -it chemical_db_container mongosh $database