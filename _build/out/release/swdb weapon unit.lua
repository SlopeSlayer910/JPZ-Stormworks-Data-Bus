-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1547 (1943 with comment) chars
E="f"
D="I4"
C=" = "

x=pairs
s=screen
n=string
w=n.sub
r=s.drawText
i=s.setColor
g=output.setNumber
u=n.unpack
v=n.pack
y=property.getNumber
k={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}z=1
b={}b.q=1
b.f=-1
b.l=-1
b.j={}b.j.B=y("Main Type")b.j.A=y("Sub Type")b.m=0
function onTick()a.t=input.getNumber(z)a.p=v(E,a.t)a.d=u(D,a.p)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))e()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
e()elseif a[1]==1 then
if(a[6]>>7)==b.q and b.f==-1 and(a[6]& 2^7-1)>0
then
b.f=a[6]&(2^7-1)o()else
e()end
end
elseif a[3]==1 then
b.f=-1
e()elseif a[3]==2 then
if a[1]==0 then
e()elseif a[1]==1 then
if a[5]==b.f then
if a[4]==127 then
b.l=-1
else
b.l=a[4]end
o()else
e()end
end
else
e()end
else
o()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.q
elseif b.l==-1 and b.m>60 then
b.m=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.f
_[5]=127
_[6]=(b.j.B &(2^3-1)<<4)|(b.j.A &(2^4-1))elseif false then
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])g(1,_.d)_.p=v(D,_.d)_.t=u(E,_.p)g(z,_.t)b.m=b.m+1
g(2,b.q)g(3,b.f)g(4,b.l)end
function onDraw()i(20,20,20)s.drawClear()i(0,255,0)local c=0
for k,h in x(k)do
c=c+1
r(2,6*c-4,w(h,1,3)..C..a[h])end
i(255,0,0)for k,h in x(k)do
c=c+1
r(2,6*c-2,w(h,1,3)..C.._[h])end
i(0,0,0)c=c+1
r(2,6*c,"Weapon")end
function o()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function e()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
