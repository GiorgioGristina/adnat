# Adnat

 Simplified version of the Tanda web app from scratch using Ruby on Rails.

## Installation
 
 Clone the project:

 ```
 git clone https://github.com/GiorgioGristina/adnat.git
 cd adnat
 ```

 Make sure you are using ruby v2.7.3, check it, using this command:

 ```
 ruby -v
 ```

 Run this command to install gems:

 ```
 bundle install
 ```

 Run this command to install all dependencies:

 ```
 yarn install
 ```

 Run these commands to create data base, migrate the schema's table and create fake date from the seed file: 

 ```
 rails db:create db:migrate db:seed
 ```

 Run the server:

 ```
 rails s
 ```

 Open your favourite browser and go to: http://localhost:3000

 ## Features

 The application meets all the minimum requirement indicated in the repository: https://github.com/TandaHQ/work-samples/tree/master/adnat%20(backend)

 optional feauture completed:

 1. User details

 The user can change their own name, email address and password.

 5. Overnight shifts

 When creating a shift, if the finish time of a shift is earlier than the start time, the shift should be considered overnight. For example, if the start time is 7:30pm and the finish time is 1:30am, then it is an overnight shift that goes for 6 hours.

 8. Multiple organisations 

 Some people have 2+ jobs. Extend organisation functionality to allow users to belong to more than one organisation. You will need to rethink the shifts model. Shifts currently belong to a user (who belongs to a single organisation). If there are multiple organisations involved, this falls apart, because you don't know which organisation the user worked the shift at.

 11. A datepicker for shift date field

 ## Thank You

 I would like to take this opportunity to thank you for including me in this process. It has been a great pleasure attempting this challenge. I'm looking forward to elaborating on my execution and getting your insight about what I can improve on. Many thanks!





