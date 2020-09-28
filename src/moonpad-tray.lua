--[[--
 @package   MoonPad
 @filename  statusicon.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      23.09.2020 18:30:17 -04
--]]  

ui.trayicon:set_visible(conf.notifications.status_icon)

function statusicon()
	visible = not visible
    if visible then
      ui.main_window:show_all()
    else
      ui.main_window:hide()
    end 
end

function ui.trayicon:on_activate()
	statusicon()
end

function create_menu(event_button, event_time)
    menu = Gtk.Menu {
        Gtk.ImageMenuItem {
            label = "File",
            image = Gtk.Image {
              stock = "gtk-open"
            },
            on_activate = function()
                ui.file_media_chooser:run()
            end
        },
        Gtk.SeparatorMenuItem {},
        Gtk.ImageMenuItem {
            label = "Preferencias",
            image = Gtk.Image {
              stock = "gtk-preferences"
            },
            on_activate = function()
                ui.preferences_window:run()
                ui.preferences_window:hide()
            end
        },
        Gtk.ImageMenuItem {
            label = "Ayuda",
            image = Gtk.Image {
              stock = "gtk-about"
            },
            on_activate = function()
                ui.about_window:run()
                ui.about_window:hide()
            end
        },
        Gtk.ImageMenuItem {
            label = "Quit",
            image = Gtk.Image {
              stock = "gtk-quit"
            },
            on_activate = function()
                Gtk.main_quit()
            end
        }
    }
    menu:show_all()
    menu:popup(nil, nil, nil, event_button, event_time)
end

function ui.trayicon:on_popup_menu(ev, time)
    create_menu(ev, time)
end

ui.preferences_check_tray:set_active(conf.notifications.status_icon)
