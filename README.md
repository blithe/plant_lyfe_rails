# Plant Lyfe Rails

An API for managing plant identification information, limited to leaves of the Dicotyledon taxa of flowering plants (Plantae > Vascular Plants > Seeded Plants > Angiosperms > Dicotyledon).

## Getting Started

### Requirements

1. Ruby
1. PostgreSQL (e.g. [Postgres.app][postgres-app])

### Setup

```sh
# Checkout the repo
$ git clone git@github.com:blithe/plant_lyfe_rails.git
$ cd plant_lyfe_rails

$ bin/bootstrap
```

### Testing

```sh
$ bin/rspec
```

### Running

```sh
$ bin/rails server

# Visit the site in your browser
$ open http://localhost:3000/dicots
```

## API Specifications

### Resources Types:

  Plant - General plant information
    Example JSON representation:

      {
        "id": "plant-12345",
        "common_name": "bigleaf maple",
        "subclass": "Rosidae",
        "order": "Sapindales",
        "family": "Aceraceae",
        "genus": "Acer L.",
        "species": "Acer macrophyllum Pursh",
        "leaves": [ 
          "/dicots/bigleaf-maple/leaf/110",
          "/dicots/bigleaf-maple/leaf/111"
        ]
      }

  Leaf  - Description of actual leaf specimen associated with a Plant
    Example JSON representation:

      {
        "id": "leaf-110",
        "plant": "plant-12345",
        "placement": "opposite",
        "blade": "palmately compound",
        "veins": "penniveined",
        "location": "Vancouver, BC",
        "date_found": "2014-01-01"
      }

### Supported Functionality:
  * Creating a Plant resource
  * Creating a Leaf resource subordinate to a Plant resource
  * Deleting a Leaf resource
  * Deleting a Plant resource (should delete linked Leaf resources)
  * Updating a Plant or Leaf resource
  * Retrieving a representation of a Plant or Leaf resource
  * Searching for Leaf resources based on taxonomic criteria

### Specific API Calls:

  URL: /dicots
  Accepted HTTP methods:
    GET - Should return a list of all Plant resources.
      Example Request:

        GET /dicots HTTP/1.1
        Host: subdomain.example.com:80
        Accept: */*
      
      Example Response:

        {
          "plants": [
            {
              "id": "plant-12345",
              "common_name": "bigleaf maple",
              "species": "Acer macrophyllum Pursh",
              "leaves": [
                "/dicots/bigleaf-maple/leaf/110",
                "/dicots/bigleaf-maple/leaf/111"
              ]
            },
            {
              "id": "plant-12346",
              "common_name": "big green thing"
              "species": "latinus nameus",
              "leaves": [
                "/dicots/big-green-thing/leaf/144",
                "/dicots/big-green-thing/leaf/201",
                "/dicots/big-green-thing/leaf/206"
              ]
            }
          ]
        }

  URL: /dicots/{plant-name}
  Accepted HTTP methods:
    GET - Should return a representation of the Plant, including a list of linked Leaf resources
      Example Request:

        GET /dicots/bigleaf-maple

      Example Response:

        {
          "id": "plant-12345",
          "common_name": "bigleaf maple",
          "subclass": "Rosidae",
          "order": "Sapindales",
          "family": "Aceraceae",
          "genus": "Acer L.",
          "species": "Acer macrophyllum Pursh",
          "leaves": [
            "/dicots/bigleaf-maple/leaf/110",
            "/dicots/bigleaf-maple/leaf/111"
          ]
        }

    PUT - Should create a Plant resource
      Example Request:

        PUT /dicots/ HTTP/1.1

        {
          "common_name": "mahogany",
          "subclass": "Rosidae",
          "order": "Sapindales",
          "family": "Meliaceae",
          "genus": "Swietenia",
          "species": "Sweitenia mahagoni"
        }

      Example Response:

        HTTP/1.1 201 Created
        Date: Wed, 3 Sep 2014 18:01:01 GMT
        Content-Length: 1234
        Content-Type: application/json
        Location: http://example.org/dicots/

        {
          "id": "plant-14423",
          "common_name": "mahogany",
          "subclass": "Rosidae",
          "order": "Sapindales",
          "family": "Meliaceae",
          "genus": "Swietenia",
          "species": "Sweitenia mahagoni"
        } 

    DELETE - Should delete the Plant resource and subordinate Leaf resources
      Example Request:

        DELETE /dicots/mahogany HTTP/1.1

      Example Response:

        HTTP/1.1 204 No Content

    POST - Update the Plant resource
        Example Request:

          POST /dicots/mahogany HTTP/1.1

          {
            "common_name": "mahogany",
            "subclass": "I dunno",
            "order": "something else",
            "family": "Whee!",
            "genus": "Swietenia",
            "species": "Sweitenia mahagoni"
          } 

        Example Response:
          
          HTTP/1.1 200 OK
          Date: Wed, 3 Sep 2014 18:01:01 GMT
          Content-Length: 1234
          Content-Type: application/json
          Location: http://example.org/dicots/mahogany

          {
            "id": "plant-14423",
            "common_name": "mahogany",
            "subclass": "I dunno",
            "order": "something else",
            "family": "Whee!",
            "genus": "Swietenia",
            "species": "Sweitenia mahagoni"
          } 

  URL: /dicots/{plant-name}/leaf/{leaf-id}
  Accepted HTTP methods (examples omitted, see above for similar):
    GET - Should return a representation of the Leaf
    DELETE - Should delete the Leaf resource
    POST - Should update the Leaf resource
    PUT - Create a Leaf resource subordinate to the Plant resource
        Example Request:

          POST /dicots/mahogany/leaf HTTP/1.1

          {
            "placement": "opposite",
            "blade": "palmately compound",
            "veins": "penniveined",
            "location": "Vancouver, BC",
            "date_found": "2014-01-01"
          }

        Example Response:

          HTTP/1.1 201 Created
          Date: Wed, 3 Sep 2014 18:01:01 GMT
          Content-Length: 1234
          Content-Type: application/json
          Location: http://example.org/dicots/mahogany/leaf/

          {
            "id": "leaf-307",
            "plant": "plant-14423",
            "placement": "opposite",
            "blade": "palmately compound",
            "veins": "penniveined",
            "location": "Vancouver, BC",
            "date_found": "2014-01-01"
          }

  URL: /dicots/leaf/search
  Accepted HTTP methods:
    GET - Should return a list of Leaf resources matching the submitted criteria
      Example Request:

        GET /dicots/leaf/search?placement=opposite&blade=plamately%20compound HTTP/1.1

      Example Response:

        HTTP/1.1 200 OK
        Date: Wed, 3 Sep 2014 18:01:01 GMT
        Content-Length: 1234
        Content-Type: application/json
        Location: http://example.com/dicots/leaf/search?placement=opposite&blade=plamately%20compound

        {
          "leaves": [
            {
              "id": "leaf-307",
              "plant": "plant-14423"
            },
            {
              "id": "leaf-110",
              "plant": "plant-12345"
            }
          ]
        }



[postgres-app]: http://postgresapp.com
