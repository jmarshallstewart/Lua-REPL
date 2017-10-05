#include "lua.hpp"
#include <string>
#include <iostream>
using namespace std;

void showIntroText()
{
	cout << "This is a REPL for the Lua scripting language." << endl;
	cout << LUA_COPYRIGHT << endl << endl;
	cout << "Enter \"quit\" to exit." << endl << endl;
}

void printError(lua_State* state)
{
	cout << "ERROR: " << luaL_checkstring(state, -1) << endl;
}

int main()
{
	showIntroText();

	// create a new Lua state to hold all functions, variables, etc. we use as 
	// an environment for our scripts.
	lua_State* state = luaL_newstate();

	// make standard libraries available in the state.
	luaL_openlibs(state);
		
	// for storing input read from the keyboard.
	string input;
		
	// Evaluate user input as lua script. Evaluate each line until "quit" is entered. 
	do {
		// read input from keyboard.
		cout << "> ";
		getline(cin, input);

		// convert input to a null-terminated C-style string.
		const char* command = input.c_str();

		int result = luaL_loadbuffer(state, command, strlen(command), nullptr);

		if (result == LUA_OK)
		{
			result = lua_pcall(state, 0, LUA_MULTRET, 0);

			if (result != LUA_OK)
			{
				printError(state); // pcall failed
			}
		}
		else
		{
			printError(state); // loadbuffer failed
		}
	}
	while (input != "quit");
		
	// release memory associated with our state.
	lua_close(state);
}