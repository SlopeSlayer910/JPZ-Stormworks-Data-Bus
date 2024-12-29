-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1418 (1814 with comment) chars
z=" = "
y="f"
x="I4"

p=screen
o=string
s=o.sub
m=p.drawText
k=p.setColor
h=output.setNumber
w=o.unpack
t=o.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}u=1
b={}b.r=1
b.d=-1
b.j=-1
b.i=-1
function onTick()a.n=input.getNumber(u)a.l=t(y,a.n)a.c=w(x,a.l)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.r and b.d==-1 then
b.d=a[6]&(2^7-1)q()else
f()end
end
elseif a[3]==1 then
b.d=-1
b.j=-1
f()elseif a[3]==2 then
if a[1]==0 then
f()elseif a[1]==1 then
if a[5]==b.d
then
if a[4]~=127 then
b.j=a[4]else
b.j=-1
end
q()else
f()end
end
else
f()end
else
q()end
if _[2]==1 then
if b.d==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.r
elseif b.j==-1 and b.i>30 then
b.i=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.d
_[5]=127
_[6]=1
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.l=t(x,_.c)_.n=w(y,_.l)h(u,_.n)b.i=b.i+1
h(2,b.r)h(3,b.d)h(4,b.j)h(5,b.i)end
function onDraw()k(20,20,20)p.drawClear()k(0,255,0)local v=0
for e=1,#g,1 do
m(2,6*e-4,s(g[e],1,3)..z..a[e])end
k(255,0,0)for e=1,#g,1 do
m(2,6*e+#g*6-2,s(g[e],1,3)..z.._[e])end
k(0,0,0)v=#g*2+1
m(2,6*v,"Launcher")end
function q()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
