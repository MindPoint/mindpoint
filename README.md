# Mind Point

## Widget Book
To start Widget Book and inspect all components, run the following commands:

```
flutter pub run build_runner watch
```

```
flutter run -t lib/main.widgetbook.dart -d windows --hot
```

# Architecture
## Constants
All custom constants in the app starts with a letter K. Example: ```dart final color = KColors.black;```

# HOW TO's
## Testing
[https://docs.flutter.dev/cookbook/testing/unit/introduction](Flutter test introduction)
[https://firebase.flutter.dev/docs/testing/testing/](FireBase Mocking)

## How do i generate an SHA1 to use FireBase Auth?
To be able to use the Firebase Auth, you should generate an SHA1
[https://stackoverflow.com/questions/54557479/flutter-and-google-sign-in-plugin-platformexceptionsign-in-failed-com-google](When getting the PlattaformExeption error)