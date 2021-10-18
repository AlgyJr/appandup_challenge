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
MIT License

Copyright (c) 2021 ALgy Aly

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
