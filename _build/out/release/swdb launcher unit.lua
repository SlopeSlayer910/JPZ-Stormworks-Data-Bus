-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1150 (1546 with comment) chars
x="f"
w="I4"
v=" = "

k=screen
m=string
r=m.sub
j=k.drawText
h=k.setColor
i=output.setNumber
p=m.unpack
s=m.pack
e={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}q=1
b={}b.o=1
b.g=-1
function onTick()a.n=input.getNumber(q)a.l=s(x,a.n)a.c=p(w,a.l)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.o and b.g==-1 then
b.g=a[6]&(2^7-1)t()else
f()end
end
elseif a[3]==0 then
b.g=-1
f()else
f()end
else
t()end
if _[2]==1 then
if b.g==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.o
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.c)_.l=s(w,_.c)_.n=p(x,_.l)i(q,_.n)i(2,b.o)i(3,b.g)end
function onDraw()h(20,20,20)k.drawClear()h(0,255,0)local u=0
for d=1,#e,1 do
j(2,6*d-4,r(e[d],1,3)..v..a[d])end
h(255,0,0)for d=1,#e,1 do
j(2,6*d+#e*6-2,r(e[d],1,3)..v.._[d])end
h(0,0,0)u=#e*2+1
j(2,6*u,"Launcher")end
function t()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
