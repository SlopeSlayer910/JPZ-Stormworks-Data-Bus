-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1411 (1807 with comment) chars
z="f"
y="I4"
x=" = "

o=screen
m=string
v=m.sub
l=o.drawText
k=o.setColor
h=output.setNumber
t=m.unpack
s=m.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}w=1
b={}b.n=1
b.e=-1
b.j=-1
b.i=-1
function onTick()a.p=input.getNumber(w)a.q=s(z,a.p)a.c=t(y,a.q)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.n and b.e==-1 then
b.e=a[6]&(2^7-1)r()else
f()end
end
elseif a[3]==1 then
b.e=-1
f()elseif a[3]==2 then
if a[1]==0 then
f()elseif a[1]==1 then
if a[5]==b.e
then
if a[4]~=127 then
b.j=a[4]else
b.j=-1
end
r()else
f()end
end
else
f()end
else
r()end
if _[2]==1 then
if b.e==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.n
elseif b.j==-1 and b.i>10 then
b.i=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.e
_[5]=127
_[6]=0
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.q=s(y,_.c)_.p=t(z,_.q)h(w,_.p)b.i=b.i+1
h(2,b.n)h(3,b.e)h(4,b.j)h(5,b.i)end
function onDraw()k(20,20,20)o.drawClear()k(0,255,0)local u=0
for d=1,#g,1 do
l(2,6*d-4,v(g[d],1,3)..x..a[d])end
k(255,0,0)for d=1,#g,1 do
l(2,6*d+#g*6-2,v(g[d],1,3)..x.._[d])end
k(0,0,0)u=#g*2+1
l(2,6*u,"Launcher")end
function r()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
