--[[--
 @package   MoonPad
 @filename  moonpad-prefences.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      24.09.2020 21:41:15 -04
]]

height_window = tonumber(conf.desing.height)
width_window  = tonumber(conf.desing.width)

function window_height_width()
	local width = ui.preferences_width_spin:get_value_as_int(ui.preferences_width_spin)
	local height = ui.preferences_height_spin:get_value_as_int(ui.preferences_height_spin)
	conf.desing.height = height
	conf.desing.width = width
end

ui.preferences_height_spin:set_value(height_window)
ui.preferences_width_spin:set_value(width_window)
ui.main_window.height_request = height_window
ui.main_window.width_request = width_window

function ui.preferences_check_tray:on_clicked()
	if (self:get_active()) then
		ui.trayicon:set_visible(true)
		conf.notifications.status_icon = true
	else
		ui.trayicon:set_visible(false)
		conf.notifications.status_icon = false
	end
	config:save(('%s/moonpad.json'):format(dir), conf)
end

function ui.preferences_check_decoration:on_clicked()
	if (self:get_active()) then
		ui.main_window.decorated = true
		conf.view.decorated = true
	else
		ui.main_window.decorated = false
		conf.view.decorated = false
	end
	config:save(('%s/moonpad.json'):format(dir), conf)
end
ui.preferences_check_decoration:set_active(ui.main_window.decorated)

function ui.preferences_check_show_toolbar:on_clicked()
	if (self:get_active()) then
        ui.main_toolbar:show()
		conf.view.show_toolbar = true
	else
		ui.main_toolbar:hide()
		conf.view.show_toolbar = false
	end
	config:save(('%s/moonpad.json'):format(dir), conf)
end
ui.preferences_check_show_toolbar:set_active(conf.view.show_toolbar)

function ui.preferences_check_note:on_clicked()
	if (self:get_active()) then
		conf.other.delete_note = true
	else
		conf.other.delete_note = false
	end
	config:save(('%s/moonpad.json'):format(dir), conf)
end
ui.preferences_check_note:set_active(conf.other.delete_note)

function ui.preferences_check_log:on_clicked()
	if (self:get_active()) then
		conf.other.log = true
	else
		conf.other.log = false
	end
	config:save(('%s/moonpad.json'):format(dir), conf)
end
ui.preferences_check_log:set_active(conf.other.log)

function ui.btn_preferences_close:on_clicked()
    window_height_width()
    ui.preferences_window:hide()
    config:save(('%s/moonpad.json'):format(dir), conf)
end

