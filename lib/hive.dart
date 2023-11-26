/***
 * 
 * 1
 * Add dependencies
 * --------------
 * !hive_flutter
 * !hive_generator
 * also need 
 * !build_runner
 * 2
 * initialize hive
 * -----------
 *  -make main async 
 * ! await Hive.initFlutter();
 *  -import
 * !import 'package:hive_flutter/hive_flutter.dart';
 * 3
 * open a box
 * ----------
 * -below the initialization in main
 * -create a var varible to store box
 * -give it a name MyBox
 * ! var box = Hive.openBox("MyBox");
 * 4
 *  create a folder n file n class
 * ----------------
 * -create a new folder for database
 * -create a file
 * -create a new class in it
 * !class ToDoDataBase{}
 * 5
 * reference
 * ---------
 * -reference the box that we created
 * -create reference both in database class
 * -also in the pages we neededed
 * -this code both in home page and database class
 * !final _myBox = Hive.box("MyBox");
 * 
 * 6
 * create variables needed in it
 * ---------------------
 * -these are to store data
 * -create it inside hive class
 * !List toDoList=[];
 * -delete the list we give in the home page(previous static data)
 * 
 * 7 
 * create object
 * -----------
 * -create an object of our database clas in data needed page
 * -we created in home page
 * !ToDoDataBase db= TodoDataBase();
 * 
 * 8
 * access object
 * ----------
 * -access the variable inside this class to get data
 * -access using created object
 * -use object everywhere in the ui where we previously accessed the list/data
 * !db.toDoList//add db everywhere before toDoList
 * 9
 * crate initial data
 * ------------------
 * -inside the database class create a function
 * -for initialise data to variable 
 * run this function if this is first time ever opening the app
 ** -it is done just to give an idea about what the app is exactly doing
 * !void createInitialData(){
 * toDoList = [
      ["Learn Hive", false],
      ["Learn Getx", false]
    ];
 * }
 * 10
 * call initail data
 * ---------------
 * -call this function inside the initState() of homepage
 * -the calling is done in two part 
 * -in the if part check if our list empty
 * -then it is starting of our app 
 * *calls createInitialData
 * -in the else part 
 * -here we can stste that if there is data inside the list the app is not running first time
 * -thus call the loadData function here
 * -to load the data inside the list
 * *call loadData
 * !if(_myBox.get("TODOLIST") == null)
  {
    //there is no data
    db.createInitialData();
  }else{
    //there already exists data
    db.loadData();
  }

  11
 * selection
 * ---------
 * -craete a function inside the class to load the items in the db
 * !void loadData{
 *    toDoList = _myBox.get("TODOLIST");
 **this TODOLIST work as a key to database
 * }
 * 
 * 11
 * updation
 * --------
 * -create a function inside db to update the data we created
 * !void updateData{
 *!    _myBox.put("TODOLIST",toDoList);
 * }
 * 12
 * call update
 * ----------
 * -whereever we are making a change in our data
 * -in the ui(in all the add ,delete functions)
 * -inside those all functions we have to call 
 * -this function
 * *inside checkBoxChanged(),saveTask(),deleteTask()
 * !db.updateData();
 * 
 * 
 * 
 * 
 * 

 */