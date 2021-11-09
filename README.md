# Recipes API

Sample web application that uses Contentful API to fetch data

# To run the app

## Set up credentials

You can either directly replace `SPACE_ID` and `ACCESS_TOKEN` in `api_communator.rb` or 
create an `.env` file and store the credentials as:
```bash
SPACE_ID=spaceid
ACCESS_TOKEN=accesstoken
```

## Install dependencies

```bash
bundle install
```

## Run the app

```bash
rails s
``` 


# Data to Render

Recipes with attributes 

- title 
- image 
- description
- chef name
- tags


# Overview

I followed the software design pattern of __Model-View-Controller (MVC)__ in order to solve the task.

I created 
- Recipe model with attributes
- Recipes controller  
- Routes which would point to the view and display the action written in the controller

For fetching data I created 
- `ApiCommunicator` class in `api_communator.rb` file with `get_recipes()` method
which communicates with the Contentful API
- I used `ApiCommunicator` and `get_recipes()` method in the seed file to create data for the database

To create the database I used the following commands
```bash
rails db:create
rails db:migrate
rails db:seed
```

Once the data was set up in the controller I added
- `home()` method to load the view data of all recipes to be rendered in view page `home.erb.html`
- `show()` method to load a detailed view of each recipe to be rendered in the view page `show.erb.html`