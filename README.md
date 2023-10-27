# flutter_starter_template_with_rivepod_&_go_router

This is the flutter starter template app with clean architecture using flutter_riverpod and go_router.

The app uses the API from [here](https://github.com/SaujanBindukar/nodejs_api).
[https://github.com/SaujanBindukar/nodejs_api](https://github.com/SaujanBindukar/nodejs_api)

The key features include:
  1. Login and Signup with API
  2. Local Database implementation using Hive
  3. State Management with flutter_riverpod (latest) with code generation technique
  4. Light and Dark Mode Switch Options
  5. Custom Textfield and Buttons


## Get Started

To get started, first clone or download the repository to your pc or laptop. Then run `flutter pub get` command in your terminal to download and cache all the dependencies. After that make sure to run `flutter pub run build_runner build --delete-conflicting-outputs` command to execute the code generator to generate necessary files related to `freezed` and `json serialization`. And you are good to go 🚀.

Important Steps:
1. Get the Api from [https://github.com/SaujanBindukar/nodejs_api](https://github.com/SaujanBindukar/nodejs_api).
2. Follow the readme steps of the above API to run the API locally.
3. Start your server and you are good to go.

4. Create an .env file and add your IP to run the API on your device locally.

```dart
API_IP = your-ip
```

   


## App Architecture and Folder Structure

The code of the app implements clean architecture to separate the UI, domain and data layers with a features-first approach for folder structure.

#### Folder Structure

```
lib
├── app
├── core
│   ├── app
│   ├── app_setup
│   │   ├── dio
│   │   │    ├── interceptors
│   │   │    ├── dio_client.dart
│   │   ├── hive
│   │   ├── failure
│   ├── entities
│   ├── extension
│   ├── routes
│   ├── services
│   │   │    ├── app_endpoint.dart
│   ├── theme
│   ├── utils
│   ├── widgets
├── features
│   ├── auth
│   │   ├── application
│   │   ├── infrastructure
│   │   │    ├── entities
│   │   │    └── repository
│   │   └── presentation
│   ├── home
│   │   ├── application
│   │   ├── infrastructure
│   │   │    ├── entities
│   │   │    └── repository
│   │   └── presentation
├── my_observer.dart
└── main.dart
```

## Previews

<table>
  <tr>
    <td>Light Mode</td>
     <td>Dark Mode</td>
</tr>
<tr>
    <td><img style="display: inline-block " src="https://github.com/SaujanBindukar/flutter_starter_template/assets/34705432/dddf9308-62ba-411a-9382-e0a5aaeedc06.png" height="600" width="350"
/>
    </td>
    <td><img style="display: inline-block" src="https://github.com/SaujanBindukar/flutter_starter_template/assets/34705432/8824ec37-e76d-40c5-b103-dc04acc1c01a.png" height="600" width="350"
          />
    </td>
    </tr>
    <tr>
    <td><img style="display: inline-block" src ="https://github.com/SaujanBindukar/flutter_starter_template/assets/34705432/d868a616-804a-4383-9d97-62bdf40228ab.png" height="600" width="350"
          />
    </td>
    <td><img style="display: inline-block" src ="https://github.com/SaujanBindukar/flutter_starter_template/assets/34705432/ab760e94-e13c-4a2d-b0b0-3e8cadf1b891.png" height="600" width="350"
          />
    </td>
  </tr>
  <tr>
</td>
    <td><img style="display: inline-block" src ="https://github.com/SaujanBindukar/flutter_starter_template/assets/34705432/085abe04-3a9f-4c12-8f4c-db084faad9ac.png" height="600" width="350" />
    <td><img style="display: inline-block" src="https://github.com/SaujanBindukar/flutter_starter_template/assets/34705432/b7082d15-11c0-4e3c-b43b-df504100c880.png" height="600" width="350" />
</td>
</tr>
</table>




