# Advance Flutter App implementes BLOC
As a flutter app grows rapidly, you will realize that using simple state management (Statful Widget) is no longer an option. Until this moment state management best practice in Flutter has not exist yet. However, Flutter teams introduced BLOC, Business Logic, which is a state management approach using reactive programing (Streams Architecture).
## Note
On May 7, 2019 Google i/o introduced a Flutter for web. Although Flutter for web still in beta, it looks promising. [Click to read more](https://developers.googleblog.com/2019/05/Flutter-io19.html)
## Architecture
- ###Code shareing: 
    This architecture approach might have share more then 70% of code between diffrent platforms (web, mobile). However, abstracting and dependency injection which the way of implementing this architecture might be complex and overwhelmed
- ###Testing: 
    Testing is easier where UI and business logic are separated which can be tested separately.
## Roadmap
  - [x] Models (built value) 
  - [x] Serlization
  - [x] Repository (handles app logic)
  - [x] Bloc (state management)
  - [x] Firebase (Api Service)
  - [x] Local DB (SharedPreferences)
  - [x] Localization (i18n)
  - [ ] CI/CD (Continuous Integration Deployment)
  - [ ] GraphQL implementation
  - [ ] Global state (redux) for now
  - [ ] Errors pattrens
  - [ ] performance tests
