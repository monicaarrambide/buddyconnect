# README

This README documents all steps necessary to get the application up and running.

# Introduction

This is a web application we're developing that focuses on connecting incoming MS students to each other in order to establish
a more comfortable and friendly environment. This web application will automate a matching process between new and current students
based on their responses for questions such as work experience, career interest, extracurricular activities, place of residence, etc.,
in order to assign and set groups of other like-minded individuals. 

# Requirements

This application will need to be run and tested using:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* PostgresSQL - 12.3.0 
* Ruby Gems - Listed in `Gemfile`
* Nodejs - v16.9.1
* Yarn - 1.22.11

# External Deps

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

# Installation

Download this code repository by using git

`git clone https://github.com/https://github.com/monicaarrambide/buddyconnect.git`

# Tests

An RSpec test suite is available and can be ran using:

`rspec spec/.` OR `rspec spec/. --format documentationton` get a more in-depth reading and understanding

# Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd your_github_here`

Run **one** of the following commands for your respective device:

**For Windows or non-M1 chip Linux/Mac:**

`docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

**For M1 chip Macs or newer:**

`docker run --rm -it --volume "$(pwd):/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 --platform linux/amd64 dmartinez05/ruby_rails_postgresql:latest`

`cd rails_app`

Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app

`rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

# Environmental Variables/Files

Please refer to the `/config/environments/development.rb` file located within the repository

# Deployment

Customer App: 

Production App: 

Please refer to this link and follow directions in order to deploy to Heroku:

https://docs.google.com/document/d/1mjPJRIuQDJPMo6IIn-zcVu92VvMaDE7y/edit?usp=sharing&ouid=105801530057548120433&rtpof=true&sd=true

# CI/CD

For Continuous Integration, a workflow (workflow.yml) file was created to run Rspec, Rubocop, and Brakeman upon every push and pull requests.

The file can be found here `/.github/workflows/workflow.yml` within this repository.

Please refer to this link if you want to read more on how we set-up our continuous integration:

https://docs.google.com/document/d/1mBwyJdas5ip5dSKIlosRTiVg4yxcnkir/edit?usp=sharing&ouid=105801530057548120433&rtpof=true&sd=true

For Continuous Deployment, auto-deployment on master and test branch was used after Continuous Integration has passed on Heroku

Please refer to this link if you want to read more on how we set-up our continuous integration:

https://docs.google.com/document/d/1mjPJRIuQDJPMo6IIn-zcVu92VvMaDE7y/edit?usp=sharing&ouid=105801530057548120433&rtpof=true&sd=true

# Support

If you have any questions or concerns please reach out to us at this email: `dmcdonald15@tamu.edu` with the key phrase "Buddy Connect - Buddy pairer Support" 
in your email header. Include your question or any additional comments in the body of the email and we will get back to you as soon as we can.
