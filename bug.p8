pico-8 cartridge // http://www.pico-8.com
version 20
__lua__

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
