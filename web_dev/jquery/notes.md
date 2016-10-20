# jquery notes

## plan

* i just want to work for two hours straight and let my curiosity guide me
* i'm going to start by looking for general documents so i can get an overview
* then i'm going to think of specific things i want to do and try them
* i am going to stay away from distractions and focus on the learning
* i am going to use this file to take notes

## observations in real-time

* i don't know how to start because i am not sure why i need jquery
* looking into the code academy 
* learned basic set up from code academy
* now i can look up any effect i want to implement and set it up

## notes

* javascript library
    - html document traversal and manipulation
    - event handling
    - animation
    - ajax

* uses
    - drag elements around the page
    - open and close sliding panels
    - animate html elements
    - add new elements to html pages

### steps

* link script page on html page
    - `<script type="text/javascript" src="script.js"></script>`

* basic setup to queue jquery on script page
    - `$(document).ready(function(){
        });`

* example code
    - ```$(document).ready(function(){
           $("div").mouseenter(function() {
             $("div").fadeTo("fast", 1);
           }); $("div").mouseleave(function() {
                 $("div").fadeTo("fast", 0.5);
               });
         });```



