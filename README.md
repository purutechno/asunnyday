# asunnyday

Weather Updates

## Getting Started

#Overview
asunnyday is a weather application based on MVVM design pattern and
uses Provider as a state management library. This app displays the current
weather based on users location or Searched City.


#Screens
It has the following screens:
1) home_screen :- Displays weather based on users current location
2) search_screen :- Allows users to search for a city
3) weather_screen :- Displays weather for a searched city

#Fonts
It uses the following Fonts available in assets/fonts:
1) Butler
2) TTCommonsPro

#APIs
It uses the following API for displaying weather:
1) AccuWeather

It uses the following API to display suggestions of city for a keyword:
1) AccuWeather

It uses the following API to display weather of searched city:
1) AccuWeather


#running on Android
1. run this command in your terminal :
   a) flutter clean
   b) flutter pub get [or click "Get dependencies" in your IDE]
2. run the project in emulator or real device


#running on IOS



#running in Web



#App Flow for Android/IOS
- Install the app -> Open the app -> Location Permission pop-up appears
On Denied :
- App Pop-up appears explaining why we need location access -> Navigates to Search Screen
On Accepted :
- You're navigated to Home Screen with current Weather Updates for your city


#App Flow for Web
