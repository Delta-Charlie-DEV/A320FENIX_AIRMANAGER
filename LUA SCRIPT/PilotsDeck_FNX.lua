-- Denis Carre
-- based on work from Detlef von Reusner
-- FSUIPC7 lua script for FENIX A320
-- Dates, version, changelog
-- 2022-12-28	v1.0 Initial release
-- 2023-01-15	v1.1 Improved VS display and removed linebreak in data sent as LVARs, code cleaning
-- 2023-01-23	v1.2 Added case for freq change (don't convert string to num)
-- 2023-01-23	v1.3 Added (again) changes for VHF strings

-- Put 1=Lua PilotsDeck_FNX in [Auto] section of fsuipc.ini file for automatic start.
-- Need PilotsDeck_FNX tool by Fragtality : https://github.com/Fragtality/PilotsDeck_FNX
-- (This tool will extract the values from memory to insert them in FSUIPC offsets)


local gVar = {}
local debug_on = true

function AddVariable(lvar, vtype, len, offset)
  -- create Lvar with prefix
  -- call Lvar func per event when the associated offest changes
  -- len is optional. If len is not given the third parameter is assumed to be the offset.
  if offset == nil then offset = len end
  gVar[offset] = {}
  local var = gVar[offset]
  var.lvar = "IPCFNXA320_"..lvar
  var.type = vtype
  var.len = len
  var.offset = offset
  ipc.log("creating Lvar "..var.lvar)
  
  ipc.createLvar(var.lvar, 0)
  ipc.sleep(1000) -- needed as of Sep 5 2022
end

function OffsetChanged(offset, value)
  --ipc.log("OffsetChanged called, params: "..offset.." "..value)
  --ipc.log("type of value is "..type(value))
  --ipc.log("Value change - LVAR"..gVar[offset].lvar.." "..value)
  if gVar[offset].type == "STR" then
	value = value:gsub("[\n\r]", " ")
	if offset == 0x5408 then -- process SPD_STR
		lvar_value = string.sub(value, 5 ,-1)
		lvar_value = lvar_value:gsub("%*", "")
		lvar_value = lvar_value:gsub("% ", "")
		if debug_on then
			ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
			ipc.log("WRITE - LVAR"..gVar[offset].lvar.." "..lvar_value)
		end
		ipc.writeLvar(gVar[offset].lvar, lvar_value)	
	elseif offset == 0x5412 then -- process HDG_STR
		lvar_value = string.sub(value, 5 ,-1)
		lvar_value = lvar_value:gsub("%*", "")
		lvar_value = lvar_value:gsub("% ", "")
		if debug_on then
			ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
			ipc.log("WRITE - LVAR"..gVar[offset].lvar.." "..lvar_value)
		end
		ipc.writeLvar(gVar[offset].lvar, lvar_value)
	elseif offset == 0x5449 then -- process RUDDER TRIM
				lvar_value = value:gsub("% ", "")
				if lvar_value:find("L") then LEFT = true else LEFT = false end
				lvar_value = string.sub(lvar_value, 2 ,-1)
				if LEFT then lvar_value = "-"..lvar_value end
				if debug_on then
					ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
					ipc.log("WRITE - LVAR "..gVar[offset].lvar.." "..lvar_value)
				end					
				ipc.writeLvar(gVar[offset].lvar,lvar_value)				
	elseif offset == 0x541B then -- process ALT
				lvar_value = value:gsub("%*", "")
				lvar_value = lvar_value:gsub("% ", "")
				if debug_on then
					ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
					ipc.log("WRITE - LVAR "..gVar[offset].lvar.." "..lvar_value)
				end
				ipc.writeLvar(gVar[offset].lvar, lvar_value)
	elseif offset == 0x5422 then -- process VS	
				lvar_value = string.sub(value, 5 ,-1)
				--ipc.log("value :"..value)
				--ipc.log("LVAR value :"..lvar_value)--ipc.log(lvar_value)
				dashed = lvar_value:find("--", 1, true) ~= nil
				if dashed then
					if debug_on then
						ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
						ipc.log("WRITE - LVAR"..gVar[offset].lvar.." 9999")
					end
					ipc.writeLvar(gVar[offset].lvar, 9999)
				else
					lvar_value = lvar_value:gsub("+", "")
					if debug_on then
						ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
						ipc.log("WRITE - LVAR"..gVar[offset].lvar.." "..lvar_value)
					end
					ipc.writeLvar(gVar[offset].lvar, lvar_value)
				end
	elseif offset == 0x5451 or offset == 0x5432 then --process radio freq
			lvar_value = value
			if lvar_value:find("C") then lvar_value = lvar_value:gsub("C", "") end-- ; value="-"..value end
			if lvar_value:find("dAtA") then lvar_value = -1 end
			if debug_on then
				ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
				ipc.log("WRITE - LVAR "..gVar[offset].lvar.." "..lvar_value)
			end
			ipc.writeLvar(gVar[offset].lvar, lvar_value)
	else
			--lvar_value = tonumber(value)
			lvar_value = value
			if debug_on then
				ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
				ipc.log("WRITE - LVAR"..gVar[offset].lvar.." "..value)
			end
			--ipc.writeLvar(gVar[offset].lvar, tonumber(value))
			ipc.writeLvar(gVar[offset].lvar, value)
	end
  else
	lvar_value = value
	if debug_on then
		ipc.log("LVAR CHANGE "..gVar[offset].lvar.." -> "..value)
		ipc.log("WRITE - LVAR"..gVar[offset].lvar.." "..lvar_value)
	end
    ipc.writeLvar(gVar[offset].lvar, value)
  end
end

function StartEventWatching()
  for offset, var in pairs(gVar) do
    if var.type == "STR" then
      event.offset(offset, "STR", var.len, "OffsetChanged")
    else
      event.offset(offset, var.type, "OffsetChanged")
    end
    ipc.sleep(200) -- not sure if needed
  end
end

AddVariable("OVHD_BAT1_STR", "STR", 5, 0x543F)
AddVariable("OVHD_BAT2_STR", "STR", 5, 0x5444)
AddVariable("FCU_SPD_STR", "STR", 10, 0x5408)
AddVariable("FCU_HDG_STR", "STR", 9, 0x5412)
AddVariable("FCU_ALT_STR", "STR", 7, 0x541B)
AddVariable("FCU_VS_STR", "STR", 10, 0x5422)
AddVariable("FCU_IS_ALTVS", "STR", 2, 0x544F)
AddVariable("ISIS_BARO_STR", "STR", 6, 0x542C)
AddVariable("PED_COM_ACTIVE_STR", "STR", 8, 0x5451)
AddVariable("PED_COM_STNDBY_STR", "STR", 8, 0x5432)
AddVariable("PED_XPDR_STR", "STR", 5, 0x543A)
AddVariable("PED_RUDDERTRIM_STR", "STR", 7, 0x5449)


StartEventWatching()