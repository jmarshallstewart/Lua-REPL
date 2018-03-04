-- This file is a working script that demonstrates the basic syntax of the Lua scripting language.

-- This is a one-line comment. You can put these at the ends of lines too.

--[[
This is a multiline comment.
Everything between the two surrounding symbols will be ignorned
by Lua.
]]--

-- variables can be declared and assigned like this:
score = 0

-- Notice there is no semi-colon at the end of the above statement.
-- In Lua, C-style semi-colons to end statements are optional. The conventional
-- Lua style is to omit semi-colons, but they are valid syntactically:
score = 20;

-- Lua variables are typeless, but the values they refer to have types.
myVariable = 20         -- number
myVariable = 20.125     -- also a number
myVariable = "hello"    -- string
myVariable = true       -- truth-value (true or false)
myVariable = nil        -- nil is like nullptr in C++. It means the variable does not refer to any value.
--Lua variables can hold other stuff too (threads, tables, userdata), but these are the basics.

-- Lua has a built-in library of helpful functions. The first one we'll need is print(),
-- which prints a line of text to the console (automatically adding a newline character at the end).
-- You can send multiple arguments to print() separated by comments:
age = 17
print("Bob is ", age, " years old.")

-- Compare the output above with:
io.write("Bob is ", age, " years old.\n")
-- io.write does not add extra spacing around arguments, features more error checking,
-- and you have to provide a newline if you want a line break. print() is intended
-- for quick-and-dirty debugging. Prefer io.write for other uses that require
-- formatted text.

-- Functions begin with "function" and end with "end"
function sayHi(name)
    io.write("Hi, ", name, "!\n")
end

-- You can return values from a function with the "return" keyword:
function add(a, b)
    return a + b
end

-- Lua functions can return multiple values!
function getSquareAndCube(x)
    return x * x, x * x * x
end

-- For example, if x == 3, the above function returns 9 and 27
square, cube = getSquareAndCube(3)

-- Lua variables are global by default. To create variables that are scoped to the
-- block they were created in, use the local keyword
function variableTest()
    local localX = 5 -- is in scope only while variableTest() is executing
end
print("localX: ", localX) -- expect this to print 'nil'

-- use the "and" and "or" keywords like C's "&&" and "||". Use "not" like "!":
isWithLegalGuardian = false
is17OrOlder = true
hasMoney = true

isAllowed = isWithLegalGuardian or is17OrOlder
canSeeMovieRatedR = isAllowed and hasMoney
cannotSeeMovieRatedR = not canSeeMovieRatedR

-- control flow examples:

-- if (must have matching "then" and "end")
x = 15
if x > 5 then
    io.write("greater than five\n")
end

-- You can optionally add an else statement that is
-- executed if the if-condition is false:
if x > 5 then
    io.write("x is greater than five.\n")
else
    io.write("x is less than or equal to five\n")
end

-- You can also create an "if-else" ladder with the elseif keyword like this:
score = 100

if score < 10 then
    io.write("You can do better.\n")
elseif score < 20 then
    io.write("Nice try!\n")
elseif score < 50 then
    io.write("Not a bad score at all...\n")
else
    io.write("You did really well!\n")
end

-- while (must have matching "do" and "end")
x = 0
while x < 10 do
    io.write(x, "\n")
    x = x + 1
end

-- Instead of "do-while", Lua has "repeat-until":
x = 0
repeat
    x = x + 1
until x > 10

-- for loops!
for i = 1, 15 do
    io.write(i, "\n")
end

-- You can add an optional third argument to change the iteration step for the for loop:
for i = 15, 1, -1 do -- count backwards from 15 to 1.
    io.write(i, "\n")
end

-- You can use "break" to break out of any the above loops like in C:
x = 0
while x < 10 do
    x = x + 1
    io.write(x, "\n")
    if x == 5 then
        io.write("Forget this. I am outta here.\n")
        break;
    end
end

-- Fun fact: you can use do-end to create a scope block like this:
sum = 0
do
    local xx = 227
    local yy = 115
    sum = xx + yy
end -- xx and yy go out of scope here
io.write(sum, "\n")

-- goto
-- Yes, you can use goto to jump to a label in your code.
-- A label is defined using the form ::labelNameHere::

-- Here's a example of using goto to break out of a nested loop.
--(the break keyword only breaks out of only the most deeply nested loop, not all the loops)
-- this example is copied from: http://lua-users.org/wiki/GotoStatement
for z=1,10 do
    for y=1,10 do
        for x=1,10 do
            if x^2 + y^2 == z^2 then
                io.write('found a Pythagorean triple: ', x, y, z, '\n')
                goto done
            end
        end
    end
end
::done:: -- this is the label

-- Tables
-- Aggregate (class-like) objects in Lua are tables.
-- To begin, think of tables like dictionaries, or 
-- lists of key-value pairs.

-- You can declare a table and assign it to a variable like this:
myTable = {}

-- You can add properties (key-value pairs) like this:
myTable.isActive = true

-- You can get the number of properties a table has with this syntax:
length = #myTable

-- Note that you can add keys to the table at any point during execution of
-- the script. There is no need to declare a class type beforehand like you
-- do in statically typed languages like C++.

-- Arrays(sorta...)
-- You can use a table as an array.

-- You can initialize such a table like this:
list = { 2, 4, 6, 8, 10 }

-- You can iterate over the elements of this table like so:
-- (in this example, "in" is a reserved word and ipairs() is a library function)
for index, value in ipairs(list) do
    io.write(index, ": ", value, "\n")
end

-- In lua, table-indexing begins at 1, not 0 like in many other programming languages.
-- Here is another example for iterating over a table used as a list:
for i = 1, #list do
    io.write(i, ": ", list[i], "\n")
end

-- to add things to the end of the table when using it as an array:
list[#list + 1] = nextElement

-- to remove an element from the array at a given index, use:
table.remove(list, index)

--[[

Here are all the reserved words in Lua:

and       break     do        else      elseif    end
false     for       function  goto      if        in
local     nil       not       or        repeat    return
then      true      until     while

Guess what: In the examples above, you used every single one of these at least once:)

Here are some other operators and tokens with special meanings in Lua. Again, you 
probably recognize most of these from other programming languages:

 +     -     *     /     %     ^     #
 &     ~     |     <<    >>    //
 ==    ~=    <=    >=    <     >     =
 (     )     {     }     [     ]     ::
 ;     :     ,     .     ..    ...

]]--

-- HELPFUL LIBRARY STUFF
io.write("You are running ", _VERSION, "\n")        -- shows the version of Lua that is executing your scripts.
io.write("Seconds elapsed: ", os.clock(), "\n")     -- shows time elapsed in seconds since the start of the application
math.randomseed( os.time() )                        -- seed RNG with current time.
math.random()                                       -- returns a random number between 0 and 1.
math.random(1, 6)                                   -- returns a random integer between the arguments (inclusive), so this example could return 1, 2, 3, 4, 5, or 6.

-- for complete documentation of the Lua language, C API and library, see:
-- https://www.lua.org/manual/5.3/manual.html
