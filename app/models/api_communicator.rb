require 'contentful'
class ApiCommunicator
    attr_accessor :client

    # Set up and initialize Contentful client
    def contentful_client
        client = Contentful::Client.new(
            space: ENV["SPACE_ID"],
            access_token: ENV["ACCESS_TOKEN"],
            dynamic_entries: :auto,
            raise_errors: true
        )
    end

    # Create a method to fetch the data from Contentful API
    def get_recipes
        # set an intance variable for client
        @client = contentful_client
        # request all entries from API with content type `recipe`
        @entries = client.entries(content_type: 'recipe')
        # iterate through entries instance variable `@entries`
        #  to create a new Recipe and save it to our database
        @entries.each do |x|
            # because of the nested API we have to get a specific entry 
            # both for chef and tags

            # check if the recipe has a `chef` value associated to it
            if x.fields[:chef] != nil
                # fetch a specific entry for chef by ID, get its name
                chef_name = client.entry(x.fields[:chef].id, content_type: 'chef').fields[:name]
            else
                chef_name = nil
            end

            # initialize an empty array for storing tags
            tags = []
            # check if the recipe has `tags` value(s) associated to it
            if x.fields[:tags] != nil
                # fetch a specific entry for tag by ID, get its name
                # add the result to our `tags` array
                x.fields[:tags].each do |tag|
                    tags << client.entry(tag.id, content_type: 'tag').fields[:name]
                end
            else
                tags = nil
            end
            # create Recipe object from the previously gathered data
            new_recipe  = Recipe.new(
                id: x.id,
                title: x.title,
                description: x.description,
                photo: x.photo.image_url,
                tags: tags,
                chef_name: chef_name
            ) 
            # save recipe to database
            new_recipe.save
        end   
    end
end
