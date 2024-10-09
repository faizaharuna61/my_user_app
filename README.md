# Welcome to My Users App
***

## Task
 What is the problem? And where is the challenge?
the problem is to implement a very famous architecture: MVC (Model View Controller).

## Description
 How have you solved the problem?
 i solved the problem by creating table that will be name users and will have multiple attributes 
 Create a controller by using User class from Part I
 then Add a route /. This one will respond with HTML.
 Create subdirectory views and inside, create a file named: index.html (you will have to submit it)
## Installation
 How to install your project? npm install? make? make re?
no need of inatallation on this project
## Usage
The code works perfectly according to the description on the exercise.
Use the following commands to interact with the app.

1. Running the Application
    ```
    ruby app.rb -p 8080 -o 0.0.0.0
    ```
2. Create a User
    ```
    curl -X POST -i http://localhost:8080/users -d "firstname=fName" -d "lastname=lName" -d "age=30" -d "password=secret" -d "email=name@example.com"
    ```
3. Get All users
    ```
    curl -X GET -i http://localhost:8080/users
    ```
4. Sign In
    ```
    curl -X POST -i -c cookies.txt http://localhost:8080/sign_in -d "email=name@example.com" -d "password=secret"
    ```
5. Update User Password (requires being signed in)
    ```
    curl -X PUT -i -b cookies.txt http://localhost:8080/users -d "password=newsecret"
    ```
6. Sign Out
    ```
    curl -X DELETE -i -b cookies.txt http://localhost:8080/sign_out
    ```
7. Delete User (requires being signed in)
    ```
    curl -X DELETE -i -b cookies.txt http://localhost:8080/users
    ```



### The Core Team


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering Schools Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
