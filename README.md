
# ResQFood Food Donation App
### Table of contents
- [Screenshots](#Screenshots)
- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#project-structure)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### Screenshots
![image](https://github.com/Jyothika083/ResQFood-Food-Donation-App/assets/117371810/d87b2822-2a1f-4b24-b837-f44d0a31d366)
![image](https://github.com/Jyothika083/ResQFood-Food-Donation-App/assets/117371810/17bc2255-12ac-4db3-9684-ed585bd375a9)
![image](https://github.com/Jyothika083/ResQFood-Food-Donation-App/assets/117371810/7f9f3458-290c-419f-8cfa-a75de606c480)
![image](https://github.com/Jyothika083/ResQFood-Food-Donation-App/assets/117371810/84757979-20e1-44c7-9618-52d80c3fa7fb)
![image](https://github.com/Jyothika083/ResQFood-Food-Donation-App/assets/117371810/537f2c74-bf8b-4bbb-b3d8-dd4fe28738c5)
![image](https://github.com/Jyothika083/ResQFood-Food-Donation-App/assets/117371810/2acf3bc1-3ff7-4026-be6c-6448dd6d854c)




### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Figma design guidelines for better UI accuracy

Read our guidelines to increase the accuracy of design-to-code conversion by optimizing Figma designs.
https://docs.dhiwise.com/docs/Designguidelines/intro

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens 
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```



### Libraries and tools used

- BLoC - State management
  https://bloclibrary.dev
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

