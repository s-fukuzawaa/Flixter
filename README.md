# Project 1 - *Flixter*

**Name of your app** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **7** hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User sees an app icon on the home screen and a styled launch screen.
- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.
- [x] User sees an error message when there's a networking error.
- [x] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [x] User can tap a poster in the collection view to see a detail screen of that movie
- [x] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [x] Customize the selection effect of the cell. (When clicked, dark gray background instead of white. Compatible with dark mode.)
- [x] Customize the navigation. (Added navigation titles, black background with white letters)
- [x] Customize the UI. (Made the entire app to be in dark mode. A.k.a black based background with white letters. Added button on top of large movie poster in detail view for user visibility of trailer feature.)
- [x] Run your app on a real device.

The following **additional** features are implemented:

- [x] Added a trailer feature. When user goes into detail view, the big background movie poster has a play button on it. When user clicks the button, it takes  to another segue that allows user to play the trailer. User can view this horizontally.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. The hierarchy between segues, NavigationController, and TabViewController. Do we need to keep making additional segues for every subpage? Can an app have multiple NavigationController?
2. Does passing datas through seugue cost in app efficiency? What is the limit in size of the data a segue can transfer the data?

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![Kapture 2022-06-17 at 16 24 04](https://user-images.githubusercontent.com/31524675/174412378-bfb8932c-f00e-4202-9f03-1f9935687bfb.gif)


GIF created with [Kap](https://getkap.co/).

## Notes

Some of the instructions on CodePath specification was lacking in details. For example, when implementing the DetailsViewController, it never specified that we needed to create deatilDict on DetailsViewController.h to store the data passed in from MovieViewController. There's also lack of directions on how to implement the trailer feature or the Network error alert feature. Many things had to be researched on my own. However, I did enjoy that process so I believe those challenges made me grow.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.
https://developers.google.com/youtube/v3/guides/ios_youtube_helper

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [2022] [Airei Fukuzawa]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
