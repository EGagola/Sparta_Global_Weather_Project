# Sparta_Global_Weather_Project

## Current Day services

This service checks the Current Weather Data from calling the Open Weather API. The API accesses the current weather data for over 200,000 cities. It will provide a randomly generated city Id from the API each time the test is run. The randomly generated city ids are found in the id_generator.rb file where a class was created for the random generation.

### SOM (Service Object Model)

A service object model is used to test the API. The SOM is used to define complex actions, it also helps take out the logic from other areas of the MVC files.

### The ID generator

This file is used to generate random city ids through a method called single_generator.  This method loops through the hashes, gets every city id, then stores them in an array and then gets a random city id from the array.

### The Service

The CurrentDayService was created to help the tests in the spec folder to work. Here the @cityid and @single_weather_data was initialized. We created a different method for each test that was created.  An example of a method created was key_value which gets the type key by going through the sys array.

### The Spec

For the Spec folder, we created a single_current_weather_spec file which holds all the different tests we have created.  
