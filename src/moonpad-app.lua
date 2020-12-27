--[[--
 @package   MoonPad
 @filename  moonpad-app.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      23.09.2020 18:37:43 -04
]]

display = ui.main_window:get_display()
clipboard = Gtk.Clipboard.get_for_display(display, Gdk.SELECTION_CLIPBOARD)

provider = Gtk.CssProvider()
provider:load_from_path('src/moonpad.css')
screen = Gdk.Display.get_default_screen(Gdk.Display:get_default())
GTK_STYLE_PROVIDER_PRIORITY_APPLICATION = 600
Gtk.StyleContext.add_provider_for_screen(
    screen, provider,
    GTK_STYLE_PROVIDER_PRIORITY_APPLICATION
)
function ui.main_window:on_destroy()
    Gtk.main_quit()
    log('MoonPad se ha cerrado', 'info')
end

function ui.btn_dialog_cancel:on_clicked()
    ui.delete_dialog:hide()
end

function ui.btn_copy_to_clipboard:on_clicked()
    ui.textbuffer:copy_clipboard(clipboard)
    log('Texto Copiado Al Portapapeles', 'info')
end

function ui.btn_cut_to_clipboard:on_clicked()
    ui.textbuffer:cut_clipboard(clipboard,true)
    log('El Texto Del Buffer Ha Sido Cortado Al Portapapeles', 'info')
end

function ui.btn_paste_from_clipboard:on_clicked()
    ui.textbuffer:paste_clipboard(clipboard,nil,true)
    log('Algun Texto Se A Insertado al Buffer', 'info')
end