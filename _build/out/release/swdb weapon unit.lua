-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1547 (1943 with comment) chars
E="I4"
D=" = "
C="f"

z=pairs
o=screen
n=string
x=n.sub
p=o.drawText
m=o.setColor
h=output.setNumber
v=n.unpack
y=n.pack
u=property.getNumber
j={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}w=1
b={}b.r=1
b.f=-1
b.l=-1
b.i={}b.i.B=u("Main Type")b.i.A=u("Sub Type")b.k=0
function onTick()a.q=input.getNumber(w)a.t=y(C,a.q)a.c=v(E,a.t)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))e()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
e()elseif a[1]==1 then
if(a[6]>>7)==b.r and b.f==-1 and(a[6]& 2^7-1)>0
then
b.f=a[6]&(2^7-1)s()else
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
s()else
e()end
end
else
e()end
else
s()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.r
elseif b.l==-1 and b.k>60 then
b.k=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.f
_[5]=127
_[6]=(b.i.B &(2^3-1)<<4)|(b.i.A &(2^4-1))elseif false then
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.t=y(E,_.c)_.q=v(C,_.t)h(w,_.q)b.k=b.k+1
h(2,b.r)h(3,b.f)h(4,b.l)end
function onDraw()m(20,20,20)o.drawClear()m(0,255,0)local d=0
for j,g in z(j)do
d=d+1
p(2,6*d-4,x(g,1,3)..D..a[g])end
m(255,0,0)for j,g in z(j)do
d=d+1
p(2,6*d-2,x(g,1,3)..D.._[g])end
m(0,0,0)d=d+1
p(2,6*d,"Weapon")end
function s()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function e()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
