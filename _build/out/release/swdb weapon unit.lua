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

u=pairs
p=screen
o=string
w=o.sub
n=p.drawText
k=p.setColor
g=output.setNumber
z=o.unpack
y=o.pack
v=property.getNumber
m={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}x=1
b={}b.s=1
b.f=-1
b.l=-1
b.i={}b.i.A=v("Main Type")b.i.B=v("Sub Type")b.j=0
function onTick()a.q=input.getNumber(x)a.t=y(E,a.q)a.d=z(D,a.t)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))e()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
e()elseif a[1]==1 then
if(a[6]>>7)==b.s and b.f==-1 and(a[6]& 2^7-1)>0
then
b.f=a[6]&(2^7-1)r()else
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
r()else
e()end
end
else
e()end
else
r()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.s
elseif b.l==-1 and b.j>60 then
b.j=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.f
_[5]=127
_[6]=(b.i.A &(2^3-1)<<4)|(b.i.B &(2^4-1))elseif false then
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])g(1,_.d)_.t=y(D,_.d)_.q=z(E,_.t)g(x,_.q)b.j=b.j+1
g(2,b.s)g(3,b.f)g(4,b.l)end
function onDraw()k(20,20,20)p.drawClear()k(0,255,0)local c=0
for m,h in u(m)do
c=c+1
n(2,6*c-4,w(h,1,3)..C..a[h])end
k(255,0,0)for m,h in u(m)do
c=c+1
n(2,6*c-2,w(h,1,3)..C.._[h])end
k(0,0,0)c=c+1
n(2,6*c,"Weapon")end
function r()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function e()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
