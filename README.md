# bloggr
The goal of this project is to demonstrate how a simple blogging app could work using CLEAN architecture. The basic features of the app are:
- view a list of all available blog posts
- view the detail of a single blog post with comments on that post

### Plan
From reading the requirements and given the time limit of 4 hours, it is clear that shortcuts need to be taken to have a working solution. I decided to focus on the architecture of the app as I think there are many interesting talking points about this. 

I created a Whimsical drawing to figure out how I might solve this problem in CLEAN architecture and to get an understanding of the components that would be required and how they would fit together.
![Alt text](bloggr.png?raw=true "Architecture plan")

### Architecture
Breakdown of the architecture:
- `DataLayer` - the external layer which communicates to external services, they should be replacable with ideally no change to the `DomainLayer` (there would most likely be minimal changes required in practice)
- `DomainLayer` - contains the business logic and models of the app. This should be the most stable layer of the app and is the "source of truth" that everything else is based on.
- `UI Layer` - contains the views, navigation and user input. Components here should be replacable and should not contain business logic, it should be purely a presentation layer.

### Shortcuts
- `Network` - it is an oversimplified networking class which has been tailored purely for this project. It seemed to be the most lightweight solution for what was required.
- No tests - the positive side of CLEAN architecture is that it enables tests of most components as each layer is separated by protocols this can be easily replaced with fake classes which can be used for testing. The down side of CLEAN architecure is that there is a lot of boilerplate code and there are many things to "wire up" and as a result I have not had enough time to show how the testing might be done!
- UI - the user interface has really suffered and could be improved. Given the kind of app and the number of similar apps on the app store I hope that it isn't difficult to imagine how a better blogging app might look! :)

### Possible future improvements
- Add tests
- Add configuration file to store the URLs - could require `Network` to be extended.
- Improve UI
- Improve basic feature set to be able to search, filter and favourite posts.
- Having an offline version, which updates at certain intervals could be a nice feature.
