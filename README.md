CS 315
Project 1

Assigned: Oct. 11, 2024
Due: Oct. 20, 2024, 23:59
A Programming Language for Drones and its Lexical Analyzer
This semester's project is about the design of a new language for drones. Assume that you are working in the software department of a company that builds drones. The hardware department constructs drones that are equipped with the following:

A compass to detect the heading of the drone (an integer value between 0 and 359), the direction of the drone, measured as the angular distance relative to north).
A clock. A predefined function, called time, returns the current unix time (Epoch Time) in seconds.
Controls for the motors,
to turn the heading to left or right for 1 degree,
to move the drone so that it climbs up or drops down with a speed of 0.25 m/s.
to move the drone so that it moves in the heading direction forward with a speed of 0.75 m/s.
A spray nozzle that can be turned on and off for spraying the chemical in its tank.
Connection to the base computer through wi-fi. The base computer may be a desktop or a mobile device.
The programs written in your language will be executed on the base computer, which will send the appropriate commands to the drone over the wi-fi connection.
	
Drone for Agricultural Spraying.*	Traversing the whole field.**
* https://www.morningagclips.com/using-drones-for-spray-application-adoption-trends-in-us-and-worldwide/
** https://www.mdpi.com/2226-4310/10/9/755
Your team is asked to design a special purpose Programming Language to program the drones produced by the hardware department. People who purchase these drones may not be computer engineers; so it is important that the programming language is readable, writable and reliable. This newly designed language should be similar to the classical imperative languages, since the users are assumed to have taken a basic programming course in college.

Part A - Language Design (30 points)
First, you will give a name to your language and design its syntax. Note that the best way to hand in your design is its grammar in BNF form, followed by a description of each of your language components. The following is a list of features that are required in your language:

variable identifiers
assignment operator
precedence, associativity of the operators
expressions (arithmetic, relational, boolean, their combination)
loops
conditional statements
statements for input / output
function definitions and function calls.
comments
primitive functions for
get the current heading
get the current altitude
get the current time
vertically, climb up, drop down, or stop
horizontally, move forward, backward, or stop
turn the heading to left or right for 1 degree
turning the spray nozzle on or off
All of these features must be built-in in your language. Do not assume importing from a library.

You are encouraged to use your imagination to extend the list given above.

You will have a chance to do minor revisions on your syntax design for Project 2, later in the semester. Language designs are almost never exactly right in the first iteration. Just try your best to make it as readable/writable/reliable as you can and keep your eyes open for what does and what does not work :)

Part B - Lexical Analysis (40 points)
In this part of this project, you will design and implement a lexical analyzer for your language, using the lex tool available on all Unix style systems. Your scanner should read its input stream and output a sequence of tokens corresponding to the lexemes you will define in your language. Since at this stage you will not be able to connect the output to a parser, your scanner will print the names of the tokens on the screen. For instance, if we were designing a C like syntax, for the input

if ( temp > 35 ) { ...

the lexical analyzer should produce the output

IF LP IDENTIFIER GR_EQ NUMBER RP LBRACE ...

Part C - Example Programs (30 points)
Finally, you will prepare at least 4 test programs of your choice that exercise all of the language constructs in your language, including the ones that you may have defined in addition to the required list given above. Be creative, and have some fun.

Your test programs should include the following two. So, you add two more test programs.

Test #1:

Define a function that takes two parameters, that are heading and distance. This function will turn the drone to the given heading and move it forward to the given distance.

Test #2:

Write a program so that the drone sprays the pesticides in its tank along the dashed blue line over the field, marked as the solid black lines, in the following figure. The drone will start on the ground at the red marked origin and will return to the same point. While spraying, the drone should be 4 meters above the ground. You can determine the dimensions of the field and the distance between the field border and spraying line. Use the function that you defined Test #1 in this test program.



Make sure your lex implementation correctly identifies all the tokens. The TA will test your lexical analyzer with these example programs along with different programs written in your language.

You are not required to write an interpreter or compiler for this language. Just write a few programs in the language you designed and make sure that the lexical analyzer produces the right sequence of tokens.

Teams
The project will be implemented in teams of two or three students. The members of the teams will be the same for this and the next project, in which you will write a parser for your programming language. Note that all members of a team will get the same grade in this part. We will assume each member has contributed to the project equally.
Submission
There are several parts that you will hand in.
A project report including the following components:
Name, ID and section for all of the project group members.
The name of your programming language.
The complete BNF description of your language.
About one paragraph explanation for each language construct (i.e. variables and terminals) detailing their intended usage and meaning, as well as all of the associated conventions.
Descriptions of how nontrivial tokens (comments, identifiers, literals, reserved words, etc) are defined in your language. For all of these, explain what your motivations and constraints were and how they relate to various language criteria such as readability, writability, reliability, etc.
Your lex description file
The example test program described above, written in your language
Make sure your lexical analyzer compiles and runs on dijkstra.cs.bilkent.edu.tr. The TA will test your project on the dijkstra machine, and any project that does not compile or run on this machine will get 0 on Part-B.
Your password is the same as the one for your @ug.bilkent.edu.tr e-mail account.
Please upload all of the above items to Moodle before the due date. PDF format is preferred for the project reports.
Late submissions will be accepted, with 20 points (out of 100) deduction for each extra day.
Resources
Running lex and yacc on Linux systems (accessible in Bilkent Campus)
A Compact Guide to Lex & Yacc
Good Luck! - Have fun.
