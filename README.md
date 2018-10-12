NewYorkTimes
===========

This repository contains a sample app for requesting New York Times's Top Stories API.


---
# Installation

To install the dependencies
* Open a terminal and cd to the directory containing the Podfile
* Run the `pod install` command

(For further details regarding cocoapod installation see https://cocoapods.org/)


---
# Existing Functionalities

The app is currently able to load Top Stories from New York Times's API, and show it in list form or detailed.

* When the app loads, it will load the Top Stories from New York Times's API, and show them in the tableView
* Upon selecting a Story, it will open a view with detailed data of the selected Story

---
# Development Steps

1. Create new project based on single view app
2. Create folders for MVVM pattern
3. Design the UI layout to show Top Stories in storyboard
4. Add Kingfisher pod to retrieve image from URL 
5. Add Networking Layer to handle the New York TImes's API
6. Add view model and dataSource, that will show the Top Stories at TopStoriesViewController
7. Design the UI layout to show the selected Story's detail (StoryDetailViewController)
8. Add StoryDetailViewModel
9. Add "See More" feature
10. Add Unit Test to test the process


