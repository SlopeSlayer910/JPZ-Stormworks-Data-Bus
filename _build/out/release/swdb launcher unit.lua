-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1418 (1814 with comment) chars
z="I4"
y=" = "
x="f"

m=screen
n=string
s=n.sub
r=m.drawText
k=m.setColor
g=output.setNumber
t=n.unpack
w=n.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}v=1
b={}b.o=1
b.f=-1
b.i=-1
b.j=-1
function onTick()a.q=input.getNumber(v)a.p=w(x,a.q)a.c=t(z,a.p)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))d()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
d()elseif a[1]==1 then
if(a[6]>>7)==b.o and b.f==-1 then
b.f=a[6]&(2^7-1)l()else
d()end
end
elseif a[3]==1 then
b.f=-1
b.i=-1
d()elseif a[3]==2 then
if a[1]==0 then
d()elseif a[1]==1 then
if a[5]==b.f
then
if a[4]~=127 then
b.i=a[4]else
b.i=-1
end
l()else
d()end
end
else
d()end
else
l()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.o
elseif b.i==-1 and b.j>10 then
b.j=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.f
_[5]=127
_[6]=1
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])g(1,_.c)_.p=w(z,_.c)_.q=t(x,_.p)g(v,_.q)b.j=b.j+1
g(2,b.o)g(3,b.f)g(4,b.i)g(5,b.j)end
function onDraw()k(20,20,20)m.drawClear()k(0,255,0)local u=0
for e=1,#h,1 do
r(2,6*e-4,s(h[e],1,3)..y..a[e])end
k(255,0,0)for e=1,#h,1 do
r(2,6*e+#h*6-2,s(h[e],1,3)..y.._[e])end
k(0,0,0)u=#h*2+1
r(2,6*u,"Launcher")end
function l()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function d()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
