[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/made-with-javascript.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/uses-css.svg)](https://forthebadge.com)

Yalla Notlob website using Rails , This project implementation made by by students from ITI-Intake 41-open source Cloud platform development track.

## Table of Contents

---


- [Features](#features)
- [Getting Started](#getting-started)
   - [Setup Your Environment](#setup-your-environment)
   - [Using Docker](#using-docker)
- [Dependencies](#dependencies)
- [About Us](#Authors)

## Features

---

-  User login, registrations and confirmation

- Add friends by their emails.

- Create group of your favorite friends, so that it's easier for you to invite them by using the group's name.

- Make orders and ability to invite your friends to your order, so they can participate and include their items.

- Get notifications with Accaptance of adding friends 






## Getting Started

---
To use and run this project you need to:

#### Setup Your Environment

1. Run the following command to clone: 
```
git clone https://github.com/Mohamedelbeshlawy/Yalla-Notlob.git
```
2. Run the following command to install all the required gems.

```bash
bundle install
```
3. Setup the database (mysql in this case).

```bash
rails db:create
```
```bash
rails db:migrate
```

4. To run the server 
```bash
rails s
```
5. Finally visit localhost:3000

##### Note:

Make sure that your database is up and configured properly for the application to work.

#### Using Docker

---

You can also use the docker image provided to setup a running environment
for the application to avoid any environment conflicts.

Change your working directory to the projects folder and execute the following commands (only one time)

```bash
docker-compose build
```

to build the image and then

```bash
docker-compose run app rails db:create db:migrate
```

to setup the database.

Whenever you want to run the server through the container run the following
in the project's directory.

```bash
docker-compose up
```

## Dependencies

---

- [Ruby 2.7.2](https://www.ruby-lang.org/en/)

## Authors :

1. [Mohamed Elbeshlaway](https://github.com/Mohamedelbeshlawy)

2. [Ahmed Ibrahim](https://github.com/ahmedibrahim22)

3. [Islam Reda](https://github.com/IslamReda)

4. [Nagy Adel](https://github.com/nagyadel1992)

5. [Wesal Eldsokey](https://github.com/wesalEldsokey) 
