#!/usr/bin/env lua
--[[--
 @package   MoonPad
 @filename  moonpad.lua  
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com> 
 @date      10.08.2020 17:01:07 -04
--]]

require 'libraries.middleclass'
lgi     = require('lgi')
Logger  = require("libraries.Logger")
utils   = require("libraries.utils")
json    = require("libraries.json")
config  = require('libraries.configuration')

Gtk     = lgi.require('Gtk', '3.0')
Gdk     = lgi.Gdk
GLib    = lgi.GLib

builder = Gtk.Builder()
ui = builder.objects

config:create_config('moonpad','moonpad.json')
dir       = ('%s/moonpad'):format(GLib.get_user_config_dir())
conf      = config:load(('%s/moonpad.json'):format(dir))
log_state = conf.other.log

log       = Logger("MoonPad", dir, log_state)
log('Inciando MoonPad', 'info')

log:expect(builder:add_from_file('moonpad.ui'), 'Error al cargar la gui de MoonPad')

-- MoonPad
require('src.moonpad-app')
require('src.moonpad-pad')
require('src.moonpad-preferences')
require('src.moonpad-tray')

ui.main_window:show_all()
Gtk.main()
