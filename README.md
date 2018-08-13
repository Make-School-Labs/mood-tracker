# mood-tracker
> update this readme with a detailed lesson


# Spec
Mob 1.2 in class one

## Build project
	◦	Setup storyboard
	◦	- cells
	◦	Build Models
	◦	- Entry
	◦	Build Helpers
	◦	- EntryService
	◦	Controllers
	◦	- list view
	◦	- detail view
	◦	Extensions
	◦	- date formatter
## In Class Project 1 - Mood Tracker 

#### Objectives 

- Use Segues to manage views
- Use Collections to store data
- Use Table views to display data 
- Use formatters to display dates 

#### Description 

Creates a Mood tracker that 

- Shows a list of of Moods 
- Stores the Moods with user Defaults 
- Create new Objects to represent a mood with a date 
- Update Mood Objects 

#### Stretch Challenges 

- SocialFramework Actions to share mood on Twitter and FB etc.

# Concepts learned

### Storyboard
LIST VC
- constraints, safe area, stack views, content hugging priorities
- prototype cells, custom cell classes, outlet naming
- embedding in navigation controllers
- fonts
DETAIL VC
- relational constraints
- segmented controls
- UIView.tags
- IBActions for value change events

### Models
ENTRY MODEL
- structs vs classes
- enums and raw values
- importing modules, UIKit.UIColor, type inference
- computed vars
- NSCoding
- self.var

ENTRY SERVICE
- control flow, private and private(set)
- mutating functions in structs
- user defaults
- constants file, snake case string
- guard and error handling
- indexing and mutating arrays

### View Controllers
LIST VC TABLE VIEW
- table view dataSource, delegate
- extensions to conform to protocols
- extensions to add functionality to a type
- table view methods, and vars

DETAILED VC
- protocols and class protocols
- weak vars for delegate properties
- delegation between view controllers
- in code perform for segues: sender arg
- unwind segues
