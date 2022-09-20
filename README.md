# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [ ] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/73403466/191168476-835aa0e6-e19c-49ec-9cb6-43253dc922a5.gif)


### Notes
1. ***value of type 'UIView' has no member 'af_setImage'***\
   Fix: value should be UIImageView 
2. ***setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key collectionView."***\
  Fix: Looked it up and it said outlet connections probably messed up, spent ~45 minutes trying to figure it out. But ended up just redoing the part.
3. ***Unable to show the whole movie posters for grid view*** \
   Fix: Movie grid cell too big
4. Github local branch not updated with the remote branch -> unable to push to main\
  ***Git refusing to merge unrelated histories on rebase***\
  Fix: git pull origin main --allow-unrelated-histories
## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF
![ezgif com-gif-maker](https://user-images.githubusercontent.com/73403466/189800713-3ea7b70c-2b05-479d-ba6c-ec478429f956.gif)

### Notes
- Encountered error: ***[<UIViewController 0x7ff66ec0ef30> setValue:forUndefinedKey:]***
- Encountered error: ***remote: Repository not found.*** because the git repo was initialized locally so no remote git repository were identified to the terminal
  - Fix: ```git remote set-url origin https://github.com/username/reponame```
