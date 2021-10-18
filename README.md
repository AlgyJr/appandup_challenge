# appandup_challenge
This repository contains the source code of an Android/iOS/Web application developed as a requirement for Flutter Developer Remote at AppandUp. The app makes requests to [Google Books API](https://developers.google.com/books/docs/overview) with a query(user search) and parse it's JSON to get query match books and store favorite books on Firebase.

## :camera_flash: Screenshots
<img src="/results/signin_screen.png" width="260">;<img src="/results/signup_screen.png" width="260">;<img src="/results/home.png" width="260">;<img src="/results/book_details.png" width="260">

Packages Used
--------------
* [cloud_firestore](https://pub.dev/packages/cloud_firestore) - Flutter plugin for Cloud Firestore, a close-hosted, noSQL database with live synchronization and offline support on Android and iOS.
* [firebase_auth](https://pub.dev/packages/firebase_auth) - Flutter plugin for Firebase Auth, enabling Android and iOS authentication using passwords, phone numbers and identity providers like Google, Facebook and Twitter. 
* [firebase_core](https://pub.dev/packages/firebase_core) - Flutter plugin for Firebase Core, enabling connecting to multiple Firebase apps.
* [flutter_svg](https://pub.dev/packages/flutter_svg) - An SVG rendering and widget library for Flutter, which allows painting and displaying Scalable Vector Graphics 1.1 files.
* [http](https://pub.dev/packages/http) -A composable, multi-platform, Future-based API for HTTP requests.
* [provider](https://pub.dev/packages/provider) - A wrapper around InheritedWidget to make them easier to use and more reusable.
* [flutter_facebook_auth](https://pub.dev/packages/flutter_facebook_auth) - The easiest way to add facebook login to your flutter app, get user information, profile picture and more. Web support included.

## Prerequisites
In order to test this code:
* Replace the `API_KEY` value [here](https://github.com/Algy-Jr12/appandup_challenge/blob/master/lib/constants/app_constants.dart) with your own API Key (Get it [here](https://console.cloud.google.com/apis/api/books.googleapis.com/))

## License
```
Copyright 2021 The Android Open Source Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
