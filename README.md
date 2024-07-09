# Bookly

A simple Flutter project, Developer assessment task.

## Target OS

### Android
The app only runs on the android OS, since I wasn't able to work on a Macbook.
##
### Installation

Download this repository or run this command in the desired directory.

```
git clone https://github.com/mostafakhraizat/cme_flutter_assessment
```


### Run
Clean and build the application on any Android device.
Please clean and re-install packages before fresh running the app.

### Bookly Overview
A simple books exploring mobile application:
### Bookly features

#### 1- Authentication page provides a sign in with google feature, this feature allows user to proceed and view the rest of the application.
#### 2- Books will load on the Home page init, user can drag and drop items in any order.
#### 3- User can pull down to refresh the list and add any new books to the list.
#### 4- The application will save the user sorting actions in node->node graph structure.
#### 5- Sort actions are executed after the books are initially loaded.
#### 6- Error outputs are managed based on the app's situation (no internet, wrong parsing, server failures...).


# State management and architecture:
### State management

##### I used the Bloc state management, with a solid, clean and layered architecture.

### Application layers
#### 1- UI layer: implements the view, including pages and widgets, separated based on the feature.
#### 2- Data layer: This layer responsible for data fetch and processing, it includes four main levels, (Model, Repository, Manager and Interface).
#### 3- Controller layer: This layer responsible for the application's logic, it contains the Blocs, separated to features. The Bloc handles user events, processes events, and emits states.


