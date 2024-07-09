# Bookly

A simple Flutter project, Developer assessment task.

## Download
### Target OS
#### Android
The app only runs on the android OS, since I wasn't able to work on a Macbook.

#### Installation

Download this repository or run this command in the desired directory.

```
git clone https://github.com/mostafakhraizat/cme_flutter_assessment
```


## Run
#### Run app
Clean and build the application on any Android device.
Please clean and re-install packages before fresh running the app.



## Tech overview
### What is Bookly?
A simple books exploring mobile application.
### Bookly features

#### 1- Authentication page: provides a sign in with google feature, this feature allows user to proceed and view the rest of the application.
#### 2- Books Home: books will load on the Home page init, user can drag and drop items in any order.
#### 3- Refresh: User can pull down to refresh the list and add any new books to the list.
#### 4- Sort is saved: The application will save the user sorting actions in node->node graph structure.
#### 5- Sort actions are executed after the books are initially loaded.
#### 6- Error handling: error outputs are managed based on the app's situation (no internet, wrong parsing, server failures...).
#### 7- Theme responsiveness: App is responsive with light and dark themes.



## State management and architecture:
### State management

##### I used the Bloc state management, with a solid, clean and layered architecture, the followed architecture makes my code maintainable and scalable for future changes.

### Application architecture and layers
Used a layered code architecture, app is layers are designed as following:

#### 1- UI layer: implements the view, including pages and widgets, separated based on the feature.
#### 2- Data layer: This layer responsible for data fetch and processing, it includes four main levels, (Model, Repository, Manager and Interface).
note that the interface now is not that important, but later on, if I needed to add a new data manager (eg: for books cache), the interface will ensure all functions are aligned and implemented.
#### 3- Controller layer: This layer responsible for the application's logic, it contains the Blocs, separated to features. The Bloc handles user events, processes events, and emits states.

### Other folders:
#### Resources:
contains resources like themes, assets path, colours...
#### core:
contains important config files like firebase configuration, and helpers like mixins, enums and extensions...
#
### Core notes:
Used a graph data structure to tell the sorting actions, for example, after user moves book from index 0 (id = 1) to the index 5, I save the action locally, in this structure {"1":5}, as you can see, graph is stored in Map.
#### Why did I use this structure?

Saving the list whole order will be very expensive, for this approach list reorder execution will be triggered in all cases, however, using the graph structure, sort actions only will be executed.


# Thank you for your time!😁

Pull requests are accepted.