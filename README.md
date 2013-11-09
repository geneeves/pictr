#Pictr

A simple Flickr clone built as part of [Epicodus Fall 2013](http://epicodus.com) with @anatighe and @dustinbrownman. We covered a lot of territory in building this project -- using [Devise](https://github.com/plataformatec/devise) for user authentication, and using [CanCan](https://github.com/ryanb/cancan) to limit permissions on editing and uploading photos in other user's albums. [Paperclip](https://github.com/thoughtbot/paperclip) is what's adding all the images, and [Capybara](https://github.com/jnicklas/capybara) is what's doing the integration testing, with other specs getting simplified by [FactoryGirl](https://github.com/thoughtbot/factory_girl).

We're still working out the kinks with Amazon S3 -- but should have that updated soon.

Play with it online over [here](http://pictr.herokuapp.com)

Here are some of the user stories we wrote to clarify our process:
* [x] As an administrator, I want people to sign in before posting photos and albums or favoriting photos.
* [x] As a user, I want to be able to post albums.
* [x] As a user, I want to be able to put photos in albums.
* [x] As a visitor or user, I want to be able to see all the albums.
* [x] As a visitor or user, I want to be able to see all photos.
* [x] As a visitor or user, I want to be able to search photos and albums.
* [ ] As a visitor or user, I want photos to be ordered by highest number of favorites.
