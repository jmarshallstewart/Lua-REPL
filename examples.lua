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
-- Lua style is to omit semi-colons, but they are valid syntacally:
score = 20;

-- Lua variables are typeless, but the values they refer to have a type.
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

-- Functions begin with "function" and end with "end"
function sayHi(name)
    print("Hi, ", name, "!")
end

-- You can return values from a function with the "return" keyword:
function add(a, b)
    return a + b
end

-- Lua functions can return multiple values!
function getSquareAndCube(x)
    return x * x, x * x * x 
end

-- For example, if x == 3, this function returns 9 and 27
square, cube = getSquareAndCube(3)

-- Lua variables are global by default. To create variables that are scoped to the
-- block they were created in, use the local keyword
function variableTest()
    local localX = 5 -- is in scope on while variableTest() is executing
end
print("localX: ", localX) -- expect this to print 'nil'

-- use the "and" and "or" keywords like C's "&&" and "||". Use "not" like "!":
isWithLegalGuardian = false
is17OrOlder = true
hasMoney = true

isAllowed = isWithLegalGuardian or is17OrOlder
canSeeMovie = isAllowed and hasMoney
cannotSeeMove = not canSeeMovie

-- control flow examples:

-- if (must have matching "then" and "end")
x = 15
if x > 5 then
    print("greater than five")
end

-- You can optionally add an else statement that is 
-- executed if the if-condition is false:
if x > 5 then
    print("x is greater than five.")
else
    print("x is less than or equal to five")
end

-- You can also create an "if-else" ladder with the elseif keyword like this:
score = 100

if score < 10 then 
    print("You can do better.")
elseif score < 20 then
    print("Nice try!")
elseif score < 50 then
    print("Not a bad score at all...")
else
    print("You did really well!")
end

-- while (must have matching "do" and "end")
x = 0
while x < 10 do
    print(x)
    x = x + 1
end

-- Instead of "do-while", Lua has "repeat-until":
x = 0
repeat
    x = x + 1
until x > 10

-- for loops!
for i = 1, 15 do
    print(i)
end

-- You can add an optional third argument to change the iteration step for the for loop:
for i = 15, 1, -1 do -- count backwards from 15 to 1.
    print(i)
end

-- You can use "break" to break out of any the above loops like in C:
x = 0
while x < 10 do
    x = x + 1
    print(x)
    if x == 5 then
        print("Forget this. I am outta here.")
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
print(sum)

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
                print('found a Pythagorean triple:', x, y, z)
                goto done
            end
        end
    end 
end
::done:: -- this is the label

-- Arrays(sorta...)
-- This is actually something called a Lua table, but 
-- you can also think of this particular use of a table as 
-- an array:
list = { 2, 4, 6, 8, 10 }

-- You can iterate over the elements of this table like so:
-- (in this example, "in" is a reserved word and ipairs() is a library function)
for index, value in ipairs(list) do
    print(index, ": ", value)
end

--[[

Here are all the reserved words in Lua:

and       break     do        else      elseif    end
false     for       function  goto      if        in
local     nil       not       or        repeat    return
then      true      until     while

Guess what: In the examples above, you used every single one of these at least once:)

Here are some other operators and tokens with special meanings in Lua:

 +     -     *     /     %     ^     #
 &     ~     |     <<    >>    //
 ==    ~=    <=    >=    <     >     =
 (     )     {     }     [     ]     ::
 ;     :     ,     .     ..    ...

]]--

-- HELPFUL LIBRARY STUFF
print("You are running ", _VERSION)         -- shows the version of Lua that is executing your scripts.
print("\nseconds elapsed: ", os.clock())    -- shows time elapsed in seconds since the start of the application
math.randomseed( os.time() )                -- seed RNG with current time.
math.random()                               -- returns a random number between 0 and 1.
math.random(1, 6)                           -- returns a random integer between the arguments (inclusive), so this example could return 1, 2, 3, 4, 5, or 6.
 
-- for complete documentation of the Lua language, C API and library, see:
-- https://www.lua.org/manual/5.3/manual.html
