# Sparta_Global_Weather_Project

### Before using any service:

This project requires a number of gems to be installed, which are included in the gemfile for convenience. Please run 'bundle' and they will be installed for you.

You will also need an API key, which should not be shared online, and has therefore been hidden. You can get an API key by creating an account at 'https://openweathermap.org/api'.

Following this, please create a file named '.env' in the main project directory. This file should include your api key, in the format "OPENWEATHER_API_KEY=000000000", where 000000000 is replaced with your API key.

Then simply run 'rspec' to run the test.

## Current Day Service

The Current Day Service is currently unimplemented, but will use a city id to search for the current weather.

## Five Day Service

This portion checks the results from calling the Open Weather API for a 5 day forecast, in three hour increments. It will provide a new, randomly selected set of coordinates (taken from the city list json file) to the API each time the test is run. These coordinates are generated in the coordinates_generator.rb file.

### The coordinates generator

This file is used in the test to select random coordinates from the city list through a set of two methods: generate_random_number and get_coord.

### The Service

The Five Day Weather Service has six methods to assist testing. These are designed to be reused in future tests.

The get_five_day_data method uses your API key and generated coordinates to make an http request to the API. It then returns the body of the response.

The body of the response will be an hash containing many different data types, resulting in a structure with many layers. The search_outer method takes one parameter, and looks through the base hash for a key matching the parameter.

The search_inside_city_for method works the same, but will instead look inside the city hash.

The search_list_for method is slightly different, as it takes two parameters. The list hash contains 40 datasets, so the first parameter must be an integer to choose which of these to look at. The second parameter is for the desired key.

The search_weather_for method works this same as list, but for the weather hash.

The search_list_input_for method drills down one level further into the list hash. It takes three arguments in the following order: integer, desired hash key, and the key to search for. It otherwise functions the same as above.

The Date and time at which data is collected is retrieved and stored within two values. These are the dt (delta time) and dt_txt (delta time text). These values are converted and compared through the dt_txt_format_checker method. Each value which is correct is considered true. The amount of times this happens is stored inside the variable true_values. As four values are tested, true_values is expected to be 4 if the data is correct.

### The Tests

Currently testing every feature of the hash returned from the API, to varying extents.

## Current Day Coordinate Service

This service is an alternative to the Current Day service, searching for cities instead by coordinates. The methods are similar to the Five Day service methods, but as its will only return one set of data the integer selector is removed.

The get_current_day_data method uses your API key and generated coordinates to make an http request to the API. It then returns the body of the response.
