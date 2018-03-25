# Setup Instructions

### Installation
Run: `bundle install`

### Database Setup

You need to create a new Postgres database called `autolist-lite`

If you have downloaded the Postgres CLI, run:
```
createdb autolist-lite -U <your Postgres username>
```

Once the database is created, run:
```
rake db:migrate
```

### Environment Setup

Run: `touch .env`

Add: `AUTOLIST_API_KEY=<your API key>` to your `.env` file

**That's it!**

### View the app

Run: `rails server` and go to `http://localhost:3000`

# My Decision Making

The primary constraint for this project was time. I spent 4 hours on the project, but still feel like I barely scratched the surface. I'm a far better Javascript programmer than I am Rails programmer, but because of the time constraints and the backend requirements, Rails was the most efficient choice. Ideally I would have created a Node.js + React app, but the setup alone could have taken the 4 hours for it to meet the requirements. Since an app like this would be customer facing, I saw server side rendering (SSR) as an implied constraint. Setting up SSR in a Node + react app would have added even more complexity to the setup.

### Stylesheets

Once I decided on Rails and dusted off some of my old Rails knowledge, I chose to use SASS as my CSS procompiler and to follow the BEM (Block, Element, Modifier) convention for naming and organizing classes. I've found BEM to be the most readable way to organize styles.

I developed the app mobile first and setup breakpoints (`app/assets/stylesheets/breakpoints.scss`) to facilitate development beyond mobile. I only had time to complete the mobile UI. I chose to use an 8px grid for whitespace and wrote a `spacing()` SASS function to facilitate this.

I also used Bootstrap 4 to speed up development and keep the UI decent looking without putting a ton of focus on design. Had this been a real app, I would have gone another direction.

### Data Management

This is where I would go back and do things differently. I am using a terrible pattern of creating listing records any time they are loaded on the search page. Those listings are saved to the database and accessed via the vin number on the view details page. If I were to continue working on this, I would rip that out and probably run a rake task that paginates through all possible search results and saves them to the listings table in the database. This would speed up search by pulling from the db instead of via an HTTP API call while also solving how to retrieve details for a specific vehicle. This seems like a better choice than pulling from the API every time because (as far as I can tell) the API does not provide the ability to query for a specific listing. Not considering data management in detail before I started building caused me to not be able to complete the requirement to show the view count on the search results.

### Javascript

I did not have time to implement any Javascript framework and did not see it as necessary to fulfill the requirements. If I had time, I would have used React. I would have definitely built infinite scrolling into the search page, where the controller would eager load the next page so that the results are in memory should the user reach the bottom on the search results page.

### If I had more time I would...
* Fix data management and add the view count to the search results. This would require a somewhat large refactor.
* Implemented a JS framework (probably React)
* Written unit and feature tests
* Feature tests would allow for a safer refactor when bringing in React
* Cleaned up the UI
* Handled edge cases (e.g. disallow a max price < min price and better way to know if the current page of results is the last page)

### Overall Thoughts

I did not think this exercise showcased my engineering abilities. Since I haven't used Rails in over a year, I spent a lot of time dusting off those skills. That being said, I still think Rails is the right choice given the time constraints, backend requirements, and a lack of familiarity with other frameworks that provide full suite of features offered by Ruby on Rails. I hope you give me a chance to prove that my abilities are better than this application proves.







