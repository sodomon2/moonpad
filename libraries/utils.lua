#!/usr/bin/lua
--[[--
 @package   MoonPad
 @filename  utils.lua
 @version   1.0
 @author    Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com> 
 @date      23.09.2020 17:17:11 -04
]]

local utils = class('utils')

function utils:isfile(file)
	return (io.open(tostring(file), "r") ~= nil)
end

function utils:split(str,sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end

function utils:path_name(uri)
    local uri   = uri or ''
    local _turi =  utils:split(uri,'/')
    local _name = _turi[#_turi]
    local _path = '/' .. table.concat(_turi, '/')
    table.remove(_turi,(#_turi))
    result =  { name = _name, path = _path }
    return result
end


return utils
