# News Application - Flutter

This repo is a basic News application. It is based on **GetX**. More info about [GetX](https://pub.dev/packages/get) here. The app has been setup to work with [retrofit](https://pub.dev/packages/retrofit), [dio](https://pub.dev/packages/dio), [json_annotation](https://pub.dev/packages/json_annotation) and [intl_utils](https://pub.dev/packages/intl_utils)

### Demo video iOS and Android
//Uploading...


### Screens



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

