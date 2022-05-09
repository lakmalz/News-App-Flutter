# News Application - Flutter

This repo is a basic News application. It is based on **GetX**. More info about [GetX](https://pub.dev/packages/get) here. The app has been setup to work with [retrofit](https://pub.dev/packages/retrofit), [dio](https://pub.dev/packages/dio), [json_annotation](https://pub.dev/packages/json_annotation) and [intl_utils](https://pub.dev/packages/intl_utils)

### Demo video iOS and Android
<iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0"width="788.54" height="443" type="text/html" src="https://www.youtube.com/embed/vEwSxu1hu3w?autoplay=1&fs=1&iv_load_policy=3&showinfo=1&rel=0&cc_load_policy=0&start=0&end=0&origin=http://youtubeembedcode.com"><div><small><a href="https://youtubeembedcode.com/en">youtubeembedcode.com/en/</a></small></div><div><small><a href="https://casinoutankonto.online/">casinoutankonto.online</a></small></div><div><small><a href="https://youtubeembedcode.com/de/">youtubeembedcode de</a></small></div><div><small><a href="https://bastaonlinecasino.nu">https://bastaonlinecasino.nu</a></small></div><div><small><a href="https://youtubeembedcode.com/pl/">youtubeembedcode.com/pl/</a></small></div><div><small><a href="https://sverigescasinosida.com/">Sveriges casinosida</a></small></div><div><small><a href="https://youtubeembedcode.com/en">youtubeembedcode en</a></small></div><div><small><a href="https://howtoembedayoutubevideo.net/">https://howtoembedayoutubevideo.net/</a></small></div><div><small><a href="https://youtubeembedcode.com/nl/">youtubeembedcode nl</a></small></div><div><small><a href="https://casinokortspel.com/">casino kortspel</a></small></div><div><small><a href="https://youtubeembedcode.com/nl/">youtubeembedcode nl</a></small></div><div><small><a href="https://googlemapsembed.org/">https://googlemapsembed.org/</a></small></div><div><small><a href="https://youtubeembedcode.com/en">youtubeembedcode.com/en/</a></small></div><div><small><a href="http://casinoclubben.com/">http://casinoclubben.com/</a></small></div><div><small><a href="https://youtubeembedcode.com/de/">youtubeembedcode de</a></small></div><div><small><a href="https://casinodino.se/">https://casinodino.se/</a></small></div></iframe>


### Screens

<p>
    <img width="200px" src="https://github.com/lakmalz/News-App-Flutter/blob/master/screenshots/Untitled.png"/>
    <img width="200px" src="https://github.com/lakmalz/News-App-Flutter/blob/master/screenshots/Untitled1.png"/>
    <img width="200px" src="https://github.com/lakmalz/News-App-Flutter/blob/master/screenshots/filter.png"/>
    <img width="200px" src="https://github.com/lakmalz/News-App-Flutter/blob/master/screenshots/details.png"/>
</p>

## Getting Started
1. Clone the repo(https://github.com/lakmalz/News-App-Flutter.git).
    Check out to `master` branch
    Stable branch: (https://github.com/lakmalz/News-App-Flutter/tree/master)
2. Run `flutter pub get`
3. Run `flutter pub run intl_utils:generate`
4. Run `flutter pub run build_runner build --delete-conflicting-outputs`
5. Run app.

### Libraries Used

* [Getx](https://pub.dev/packages/get)
* [Dio](https://github.com/flutterchina/dio)
* [Database](https://pub.dev/packages/floor)
* [Preferences Data](https://pub.dev/packages/flutter_secure_storage)
* [Cach Network Image](https://pub.dev/packages/cached_network_image)
* [Json Serialization](https://pub.dev/packages/json_serializable)
* [Fonts](https://pub.dev/packages/google_fonts)

## File structure

```
assets
└───fonts
└───image
    └───2.0x
    └───3.0x

libs
└───data
│   └───local
│   │   └───dao
│   │   └───entity
│   │   └───app_database.dart
│   └───models
│   │   └───articles_model.dart
│   │   └─── ...
│   └───preferences
│   │   └───secure_storage.dart
│   │   └─── ...
│   └───remote
│   │   └───respones
│   │   └─── api_client.dart
│   └───repository
│   │   └───news_repository.dart
│   │   └─── ...
└───modules
│   └───auth
│   │   └─── ...
│   └───base
│   │   └─── ...
│   └───dashboard
│   │   └───components
│   │   └─── auth_middleware.dart
│   │   └─── dashboard_binding.dart
│   │   └─── dashboard_controller.dart
│   │   └─── dashboard_screen.dart
│   └───favourite_screen
│   │   └─── ...
│   └───home_screen
│   │   └─── ...
│   └───login
│   │   └─── ...
│   └───news_details
│   │   └─── ...
│   └───profile_screen
│   │   └─── ...
│   └───user_registration
│   │   └─── ...
└───database
│   └───secure_storage_helper.dart
│   └───shared_preferences_helper.dart
│   └─── ...
└───routes
│   └───app_pages.dart
│   └───app_routes.dart
└───routes
│   └───app_pages.dart
│   └───app_routes.dart
│   └───params
│   │   └───sign_up_param.dart
│   │   └─── ...
│   └───response
│       └───array_response.dart
│       └───object_response.dart
└───networks
│   └───api_client.dart
│   └───api_interceptors.dart
│   └───api_util.dart
└───router
│   └───route_config.dart
└───services
│   └───api
│   └───store
│   └───auth_service.dart
│   └───cache_service.dart
│   └───setting_service.dart
└───utiles
│   └───gloabal_widget
│   │   └─── ...
│   └───styles
│   │   └─── ...
└───di.dart
└───app_binding.dart
└───main.dart
```
