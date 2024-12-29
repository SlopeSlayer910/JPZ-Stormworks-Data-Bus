-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1544 (1940 with comment) chars
D="f"
C=" = "
B="I4"

s=screen
o=string
y=o.sub
q=s.drawText
k=s.setColor
i=output.setNumber
w=o.unpack
x=o.pack
v=property.getNumber
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}t=1
b={}b.m=1
b.f=-1
b.h=-1
b.l={}b.l.A=v("Main Type")b.l.z=v("Sub Type")b.j=0
function onTick()a.p=input.getNumber(t)a.n=x(D,a.p)a.c=w(B,a.n)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))d()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
d()elseif a[1]==1 then
if(a[6]>>7)==b.m and b.f==-1 and(a[6]& 2^7-1)>0
then
b.f=a[6]&(2^7-1)r()else
d()end
end
elseif a[3]==1 then
b.f=-1
b.h=-1
d()elseif a[3]==2 then
if a[1]==0 then
d()elseif a[1]==1 then
if a[5]==b.f then
if a[4]==127 then
b.h=-1
else
b.h=a[4]end
r()else
d()end
end
else
d()end
else
r()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.m
elseif b.h==-1 and b.j>10 then
b.j=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.f
_[5]=127
_[6]=(b.l.A &(2^3-1)<<4)|(b.l.z &(2^4-1))elseif false then
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.c)_.n=x(B,_.c)_.p=w(D,_.n)i(t,_.p)b.j=b.j+1
i(2,b.m)i(3,b.f)i(4,b.h)end
function onDraw()k(20,20,20)s.drawClear()k(0,255,0)local u=0
for e=1,#g,1 do
q(2,6*e-4,y(g[e],1,3)..C..a[e])end
k(255,0,0)for e=1,#g,1 do
q(2,6*e+#g*6-2,y(g[e],1,3)..C.._[e])end
k(0,0,0)u=#g*2+1
q(2,6*u,"Weapon")end
function r()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function d()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
