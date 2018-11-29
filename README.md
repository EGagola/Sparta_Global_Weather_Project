# Sparta_Global_Weather_Project

### Before using any service:

This project requires a number of gems to be installed, which are included in the gemfile for convenience. Please run 'bundle' and they will be installed for you.

You will also need an API key, which should not be shared online, and has therefore been hidden. You can get an API key by creating an account at 'https://openweathermap.org/api'.

Following this, please create a file named '.env' in the main project directory. This file should include your api key, in the format "OPENWEATHER_API_KEY=000000000", where 000000000 is replaced with your API key.

Then simply run 'rspec' to run the test.

## Current Day Service





## Five Day Service

This portion checks the results from calling the Open Weather API for a 5 day forecast, in three hour increments. It will provide a new, randomly generated set of coordinates to the API each time the test is run. These coordinates are generated in the coordinates_generator.rb file.

### The coordinates generator

This file is used in the test to generate random coordinates through a set of two methods: generate_latitude and generate_longitude, respectively. This generator is tested in turn through the coordinates_generator_spec file. Specifically, it must generate floats that are valid coordinates.




## Sixteen Day Service
