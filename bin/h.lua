#!/usr/bin/env lua

-- Configuration 
file = "~/.dotfiles"

-- Helper functions to run shell commands 
echo = function (cmd) 
  os.execute("echo \"" .. cmd .. "\"")
end
nix = function (cmd) 
  os.execute("pushd " .. file .. " && " .. cmd .. " && popd")
end

-- Function to parse arguments 
parse_args = function (args)
  local res = {
    args = {},
    flags = {}
  }

  for k, v in string.gmatch(table.concat(args, " "), "(--)(%w+)") do
    if k == "--" or k == "-" then
      table.insert(res.flags, v)
    else
      table.insert(res.args, v)
    end
  end

  return res
end

-- Command execution
exec = function (option) 
  args = parse_args(option)
  cmd = args.args[1]

  -------- Help command ---------
  if cmd == "help" or cmd == "h" then
    echo([[
Hydrogen v2.0
Usage: h [command] [options]

Available commands:
  help [command]    Shows the help menu
  update            Updates the flake inputs
  rebuild [module]  Rebuild the system/home config
  test              Test the system config

Created by Tejas Agarwal (https://github.com/tejasag) ]])

  -------- Update command --------
  elseif cmd == "update" or cmd == "u" then
    nix("nix flake update")

  -------- Rebuild command ------
  elseif cmd == "rebuild" or cmd == "re" then
    if args.flags[1] == "h" then
      nix("home-manager switch --flake .#" .. (args.args[2] or "$(echo $USER)"))
    else
      nix("nixos-rebuild switch --flake .#" .. (args.args[2] or "$(hostname)"))
    end

  -------- Test command -------
  elseif cmd == "test" then
    nix("nixos-rebuild test --flake .#" .. (args.args[2] or "$(hostname)"))

  -- If no command was passed
  else
      echo("Command not found.\nPlease run the 'help' command for a list of all available commands.")
  end
end

exec(arg)

-- vim: filetype=lua
