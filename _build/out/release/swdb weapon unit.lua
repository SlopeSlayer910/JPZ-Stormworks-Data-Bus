-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1537 (1933 with comment) chars
D="f"
C="I4"
B=" = "

s=screen
n=string
x=n.sub
m=s.drawText
l=s.setColor
h=output.setNumber
v=n.unpack
w=n.pack
y=property.getNumber
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}u=1
b={}b.p=1
b.e=-1
b.k=-1
b.j={}b.j.A=y("Main Type")b.j.z=y("Sub Type")b.i=0
function onTick()a.r=input.getNumber(u)a.o=w(D,a.r)a.c=v(C,a.o)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.p and b.e==-1 and(a[6]& 2^7-1)>0
then
b.e=a[6]&(2^7-1)q()else
f()end
end
elseif a[3]==1 then
b.e=-1
f()elseif a[3]==2 then
if a[1]==0 then
f()elseif a[1]==1 then
if a[5]==b.e then
if a[4]==127 then
b.k=-1
else
b.k=a[4]end
q()else
f()end
end
else
f()end
else
q()end
if _[2]==1 then
if b.e==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.p
elseif b.k==-1 and b.i>10 then
b.i=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.e
_[5]=127
_[6]=(b.j.A &(2^3-1)<<4)|(b.j.z &(2^4-1))elseif false then
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.o=w(C,_.c)_.r=v(D,_.o)h(u,_.r)b.i=b.i+1
h(2,b.p)h(3,b.e)h(4,b.k)end
function onDraw()l(20,20,20)s.drawClear()l(0,255,0)local t=0
for d=1,#g,1 do
m(2,6*d-4,x(g[d],1,3)..B..a[d])end
l(255,0,0)for d=1,#g,1 do
m(2,6*d+#g*6-2,x(g[d],1,3)..B.._[d])end
l(0,0,0)t=#g*2+1
m(2,6*t,"Weapon")end
function q()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
