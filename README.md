# Lunch and Learn

> This application functions to search for cuisines by country, and provides opportunity to learn more about that country's culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.
>
> This app uses a service-oriented architecture. The front-end will communicate with this back-end through an API. 

## Initial Development Dates
- November 9, 2023 - November 15, 2023

## Built With
- Ruby 3.2.2
- Rails 7.0.8

## Testing Tools
- RSpec 3.12
- Capybara 
- Webmock 
- VCR 
- Pry
- Simplecov
- Shoulda-Matchers
- Factory Bot Rails
- Faker

## Schema Visualization


## To Add

### Getting Started:
* Fork the repository to your own account.
* Clone down to your local machine using your SSH key and running the command `git clone [input SSH Key here]` and pressing enter.
* As a developer, your will need to create your own API Keys for each API. A list of APIs used and their resources has been included below.

## API Usage
- This app uses:
  - [REST Countries API](https://restcountries.com) 
  - [Edamam API](https://api.edamam.com/) 
  - [YouTube API](https://www.googleapis.com/)
  - [Unsplash API](https://api.unsplash.com/)

## API Documentation 

- **GET /api/v1/recipes?country=a_country_name**: Retrieve a list of recipes for a searched country (Index).
    - Example Request Call:
    ```
    GET /api/v1/recipes?country=thailand

    Content-Type: application/json
    Accept: application/json
    ```
    - Example Response Call:
    ```
    {
        "data": [
            {
                "id": null,
                "type": "recipe",
                "attributes": {
                    "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                    "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                    "country": "thailand",
                    "image": "https://edamam-product-images.s3.amazonaws.com..."
                }
            },
            {
                "id": null,
                "type": "recipe",
                "attributes": {
                    "title": "Sriracha",
                    "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                    "country": "thailand",
                    "image": "https://edamam-product-images.s3.amazonaws.com/."
                }
            },
            {...},
            {...},
            {...},
            {etc},
        ]
    }
    ```

- **GET /api/v1/learning_resources?country=a_country_name**: Retrieve a list of Learning Resources for a searched country (Index).
    - Example Request Call:
    ```
    GET /api/v1/learning_resources?country=laos

    Content-Type: application/json
    Accept: application/json
    ```
    - Example Response Call:
    ```
    {
        "data": {
            "id": null,
            "type": "learning_resource",
            "attributes": {
                "country": "laos",
                "video": {
                    "title": "A Super Quick History of Laos",
                    "youtube_video_id": "uw8hjVqxMXw"
                },
                "images": [
                    {
                        "alt_tag": "standing statue and temples landmark during daytime",
                        "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                    },
                    {
                        "alt_tag": "five brown wooden boats",
                        "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                    },
                    {
                        "alt_tag": "orange temples during daytime",
                        "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                    },
                    {...},
                    {...},
                    {...},
                    {etc},
                ]
            }
        }
    }  
    ```

- **POST /api/v1/users**: Create a new User (Create).
    - Example Request 
    ``` 
    POST /api/v1/users

    Content-Type: application/json
    Accept: application/json

    {
    "name": "Odell",
    "email": "goodboy@ruffruff.com",
    "password": "treats4lyf",
    "password_confirmation": "treats4lyf"
    }
    ```
    - Example Response:
    ```
    {
    "data": {
        "type": "user",
        "id": "1",
        "attributes": {
            "name": "Odell",
            "email": "goodboy@ruffruff.com",
            "api_key": "jgn983hy48thw9begh98h4539h4"
            }
        }
    }
    ```

- **POST /api/v1/sessions**: Create a new Session for a user (Create).
    - Example Request 
    ``` 
    POST /api/v1/sessions

    Content-Type: application/json
    Accept: application/json

    {
    "email": "goodboy@ruffruff.com",
    "password": "treats4lyf"
    }
    ```
    - Example Response:
    ```
    {
    "data": {
        "type": "user",
        "id": "1",
        "attributes": {
            "name": "Odell",
            "email": "goodboy@ruffruff.com",
            "api_key": "jgn983hy48thw9begh98h4539h4"
            }
        }
    }
    ```

- **POST /api/v1/favorites**: Create a new Favorite for a user (Create).
    - Example Request 
    ``` 
    POST /api/v1/favorites

    Content-Type: application/json
    Accept: application/json

    {
        "api_key": "jgn983hy48thw9begh98h4539h4",
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }
    ```
    - Example Response:
    ```
    {
        "success": "Favorite added successfully"
    }
    ```

    - **GET /api/v1/recipes?country=a_country_name**: Retrieve a list of recipes for a searched country (Index).
    - Example Request Call:
    ```
    GET /api/v1/favorites?api_key=jgn983hy48thw9begh98h4539h4

    Content-Type: application/json
    Accept: application/json
    ```
    - Example Response Call:
    ```
    {
        "data": [
            {
                "id": "1",
                "type": "favorite",
                "attributes": {
                    "recipe_title": "Recipe: Egyptian Tomato Soup",
                    "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                    "country": "egypt",
                    "created_at": "2022-11-02T02:17:54.111Z"
                }
            },
            {
                "id": "2",
                "type": "favorite",
                "attributes": {
                    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                    "recipe_link": "https://www.tastingtable.com/.....",
                    "country": "thailand",
                    "created_at": "2022-11-07T03:44:08.917Z"
                }
            }
        ]
    }
    ```

## Contributors 
- Ethan Van Gorkom | [GitHub](https://github.com/EVanGorkom) | [LinkedIn](https://www.linkedin.com/in/evangorkom/)
