# Dice project

This will be a single object project to work further into TDD.
In this file I will document the process as detailed as possible to rethink about every part of it.

## Index

[Start](#Starting-the-project) <br />
[First Story](#First-story) <br />
[Second story](#Second-story) <br />
[Third story](#Third-story) <br />

### Starting the project

To start the project We made a new directory for the project, then initialised git and rspec.

```shell
$ mkdir dice
$ cd dice
$ git init
Initialized empty Git repository in /Users/saicam/Documents/projects/dice/.git/
$ rspec --init
  create   .rspec
  create   spec/spec_helper.rb
  ```
After that I made the rest of the folders tree and the README.md file

```shell
$ touch README.md
$ touch ./spec/dice_spec.rb
$ mkdir lib
$ touch lib/dice.rb
```
At this point I realised that I skipped the first steps of TDD.
I carry on making a new project in [GitHub](https://github.com/Saicam/dice), commiting the start of the project, adding a new remote to the GitHub poroject and pushing the project to GitHub

```shell
$ git add .
$ git commit -m "Project start"
5 files changed, 101 insertions(+)
create mode 100644 .rspec
create mode 100644 README.md
create mode 100644 lib/dice.rb
create mode 100644 spec/dice_spec.rb
create mode 100644 spec/spec_helper.rb
$ git remote add origin git@github.com:Saicam/dice.git
$ git push origin master
```

### User Stories

We have five different user stories to define our object.

>As a board game player,
So that I can play a game
I want to be able to roll a dice

>As a board game player,
So that I know how many steps I should move
Rolling a dice should give me a number between 1 and 6

>As a dice app developer,
So that I give players a good game experience
I want the dice roll to be randomly picked

>As a board game player,
So that I can play many types of games
I want to be able to roll any number of dice at the same time

>As a board game player,
So that I know what my score was when I rolled several dice
I want to get the result of each dice roll

We can see from the stories (and for the definition of the project itself) that we only need one object, a dice. and that it will receive the message to roll.

### First story

We will focus in the first story first.

>As a board game player,
So that I can play a game
I want to be able to roll a dice

First we need to feature test that the object dice respond to the roll messeage.

```shell
$ irb -r ./lib/dice.rb
2.2.3 :001 > d = Dice.new
NameError: uninitialized constant Dice
	from (irb):1
	from /Users/saicam/.rvm/rubies/ruby-2.2.3/bin/irb:11:in <main>
```

As we can see we don't have any Dice constant class, so let make it.

In [dice.rb](./lib/dice.rb) we add:

```ruby
class Dice
end
```
 In the next feature test I can see Dice exist.

 ```shell
 2.2.3 :001 > d = Dice.new
 => #<Dice:0x007f9ee8a72db0>
 ```

 Now we need to do a test to check if it responds to `roll`.

 In [dice_spec.rb](./lib/dice_spec.rb) we add:

 ```ruby
 require "dice"

 describe Dice do
   it { is_expected.to respond_to :roll }
 end
 ```

 Now we have a test we don't pass, let's try to make it pass.

 To make the Dice respond to `roll` we need to define that method in [dice.rb](./lib/dice.rb) by adding:

 ```ruby
 def roll
 end
 ```

It is time to commit and push this new feature of our program.

 With this our test is Green and we move on the next user story.

 ### Second story

We will focus in the second story for this part.
 >As a board game player,
 So that I know how many steps I should move
 Rolling a dice should give me a number between 1 and 6

In this story we see that the user expect to get a number between 1 and 6 when `roll` the dice. Lets test it in irb first.

```shell
2.2.3 :001 > d = Dice.new
 => #<Dice:0x007ff8a4046b00>
2.2.3 :002 > score = d.roll
 => nil
 ```
We get nil from this, we need to add a test for this feature in [dice_spec.rb](./lib/dice_spec.rb).

```ruby
it 'gives a number between 1 and 6 when rolled' do
  expect(subject.roll).to be_between(1, 6)
end
```

We add some code to pass this test.

```ruby
def roll
  2
end
```

We can see that the test is green now. It is time to commit and push.

### Third story

>As a dice app developer,
So that I give players a good game experience
I want the dice roll to be randomly picked

In this story the user need the number he gets from roll to be randomly generated. We know is always going to give a 2. So lets make a test first.
