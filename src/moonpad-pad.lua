--[[--
 @package   MoonPad
 @filename  moonpad-pad.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      24.09.2020 18:45:38 -04
]]

filename = ("%s/moonpad/%s.tmp"):format(GLib.get_user_config_dir(),os.date("%d.%m.%Y"))

if utils:isfile(filename) then
  function load_pad()
    fd = io.open(filename, "r")
    file_data = fd:read("*all")
    fd:close()
    return file_data
  end

  ui.textbuffer.text = load_pad()
end

function save_pad()
    text = ui.textbuffer.text
    file = assert(io.open(filename,'w'), 'Error loading file : ' .. filename)
    file:write(text)
    file:close()
end

GLib.timeout_add(GLib.PRIORITY_DEFAULT, 5000,function()
    save_pad()
    return true
end)

function ui.btn_delete:on_clicked()
    if conf.other.delete_note == true then
        log('¿Esta seguro que quiere borrar la nota?', 'warn')
        ui.delete_dialog:run()
        ui.delete_dialog:hide()
    else
        ui.delete_dialog:hide()
        --ui.textbuffer:delete_selection(true,true)
        log('La nota ha sido borrada', 'info')
    end
end

function ui.btn_dialog_delete:on_clicked()
    ui.delete_dialog:hide()
    log('La nota ha sido borrada', 'info')
end

