Dynamic Signs
-------------
Extend signs_lib to support texts stored in code rather than being specified in-world.


Download at https://github.com/eidy/dynamicsigns/archive/master.zip


A signid is assigned against the sign, which is used to lookup the text rather than it being specified in-world all the time.

It works for all the signs defined in signs_lib.

Example Usage
-------------

Register internationalised text using intllib:

dynamicsigns.register("traveltokapiti",S('Travel to Kapiti'))

Register a function call to look up text:

dynamicsigns.register("thetime",function() return "Game Time : " .. (minetest.get_timeofday() * 24000)  end)


Depends: default, signs_lib
 
Code license: Apache 2.0

Github: https://github.com/eidy/dynamicsigns


API
---

dynamicsigns.register(signid, text)

Register a text to be shown on a sign 

dynamicsigns.register(signid, function)

Register a function to be invoked to get the text to be shown on a sign 

 
How to localise signs
---------------------

1. Copy in your favourite mod internationalisation library

(I like intllib - https://forum.minetest.net/viewtopic.php?id=4929)

2. Register your ids

3. Create signs in your game world, then use the "/setsign" command to set the signid
(Requires server privilege)


Chat Commands
-------------

/setsign signid

Set the nearest sign to update automatically using the specified signid
Admin required

(If the signid isn't found, the sign content will be set to the signid value)

/setsign

Clear the current signid - Goes back to working like a normal sign

/showsign

Dump the contents of the sign metadata to the console


