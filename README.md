# Mind Point

## Versioning and Branching strategy
### Intro
This repo uses Semantic Versioning (SemVer), it uses [GitVersion](https://gitversion.net/) with [GitHubFlow](https://gitversion.net/docs/learn/branching-strategies/githubflow/) and [ContinuousDeployment](https://gitversion.net/docs/reference/modes/continuous-deployment) mode to ensure the correct SemVer in the releases, following the patter is extremely important to the project.

### Creating a new version
To create a new version, you should create an branch from ```main``` with the following pattern: ```release/{SemanthicVersion}```, example: if the current main branch has a tag of ```1.0``` and you want to add a feature to it, you should create a branch with the following name ```release/1.1```, when it is merged with ```main``` it will bump the correct version.

## CI/CD
* The ```main``` branche automagically builds, create a release with artifacts and tags to be deployed to Google play.
* All ```release/*``` branches, automagically builds and creates a relese with artifacts and tags, but it **will not** deploy to Google Play.


# HOW TO's

## Build Runner
This tool is used to generate boilerplate code in the app, freezed package uses it to generate typings for JSON data.
```
flutter pub run build_runner watch
```
## Testing
[Flutter test introduction](https://docs.flutter.dev/cookbook/testing/unit/introduction)
[Firebase Mocking](https://firebase.flutter.dev/docs/testing/testing/)

## How do i generate an SHA1 to use FireBase Auth?
To be able to use the Firebase Auth, you should generate an SHA1
[https://stackoverflow.com/questions/54557479/flutter-and-google-sign-in-plugin-platformexceptionsign-in-failed-com-google](When getting the PlattaformExeption error)