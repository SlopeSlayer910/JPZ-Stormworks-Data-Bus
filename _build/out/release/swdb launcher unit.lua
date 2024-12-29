-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1418 (1814 with comment) chars
z="f"
y=" = "
x="I4"

o=screen
p=string
t=p.sub
l=o.drawText
k=o.setColor
h=output.setNumber
u=p.unpack
v=p.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}w=1
b={}b.q=1
b.d=-1
b.i=-1
b.j=-1
function onTick()a.r=input.getNumber(w)a.n=v(z,a.r)a.c=u(x,a.n)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))e()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
e()elseif a[1]==1 then
if(a[6]>>7)==b.q and b.d==-1 then
b.d=a[6]&(2^7-1)m()else
e()end
end
elseif a[3]==1 then
b.d=-1
b.i=-1
e()elseif a[3]==2 then
if a[1]==0 then
e()elseif a[1]==1 then
if a[5]==b.d
then
if a[4]~=127 then
b.i=a[4]else
b.i=-1
end
m()else
e()end
end
else
e()end
else
m()end
if _[2]==1 then
if b.d==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.q
elseif b.i==-1 and b.j>10 then
b.j=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.d
_[5]=127
_[6]=0
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.n=v(x,_.c)_.r=u(z,_.n)h(w,_.r)b.j=b.j+1
h(2,b.q)h(3,b.d)h(4,b.i)h(5,b.j)end
function onDraw()k(20,20,20)o.drawClear()k(0,255,0)local s=0
for f=1,#g,1 do
l(2,6*f-4,t(g[f],1,3)..y..a[f])end
k(255,0,0)for f=1,#g,1 do
l(2,6*f+#g*6-2,t(g[f],1,3)..y.._[f])end
k(0,0,0)s=#g*2+1
l(2,6*s,"Launcher")end
function m()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function e()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
