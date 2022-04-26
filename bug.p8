pico-8 cartridge // http://www.pico-8.com
version 20
__lua__

--integer division substitution

--local lbl_a = lbl_lev..(flr((l.id-1)/wrl_lev[hard])+1).."-"..st
--c=flr(1+((t+bt)/21)%3)

--rewrite integer division @todo: incomplete
local pattern="\\n"
local form="<NEWLINE>"
lua=lua:gsub(pattern,form)
pattern="([%w%p_%%%+%-%*]*)\\([%w%p_%%%+%-%*^]*)"
form="flr(%1/%2)"
lua=lua:gsub(pattern,form)
pattern="<NEWLINE>"
form="\\n"
lua=lua:gsub(pattern,form)


lua=[=[
  fdat = [[0188.c218| 0108.4210} 02a8.0000`*013e.e500]]

fdat = [[0188.c218| 0108.4210} 02a8.0000`*013e.e500]]
fdat = [[0188.c218| 0108.4210} 02a8.0000`*013e.e500]]

  if 2 | passmask
  if 2|mmmask
  pdata[num] = o | pdata[num] ]=]


--this captures the whole long string
pattern="(.*%[+%[+.-%]+%]+)(.*)"
form=function(a, b)
  b=string.gsub(b,"([%w%s[^\n]]*)%s*|%s*([%w%[%]]*)"," bor(%1 , %2) ")
  return a.."\n"..b
end

--this only changes the | inside long string
--pattern="(%[%[.-)|(.-%]%])"
--form="%1--OR--%2"

lua=string.gsub(lua,pattern,form)
print("\n\n"..lua)

lua=[=[
  fdat = [[0188.c218| 0108.4210} 02a8.0000`*013e.e500]]

  if(pass) ld = ld+2 | pass_mask + 5
  if(mm)   ld = ld+2|mm_mask + 5

  pdata[num] = o | pdata[num]
]=]
