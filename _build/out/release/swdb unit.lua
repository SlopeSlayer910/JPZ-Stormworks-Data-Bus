-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1156 (1552 with comment) chars
y="f"
x="I4"
w=" = "

v=pairs
l=screen
k=string
u=k.sub
n=l.drawText
j=l.setColor
i=output.setNumber
t=k.unpack
s=k.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}r=1
b={}b.o=1
b.f=-1
function onTick()a.m=input.getNumber(r)a.p=s(y,a.m)a.d=t(x,a.p)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))g()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
g()elseif a[1]==1 then
if(a[6]>>7)==b.o and b.f==-1 then
b.f=a[6]&(2^7-1)q()else
g()end
end
elseif a[3]==1 then
b.f=-1
g()else
g()end
else
q()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.o
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.d)_.p=s(x,_.d)_.m=t(y,_.p)i(r,_.m)i(2,b.o)i(3,b.f)end
function onDraw()j(20,20,20)l.drawClear()j(0,255,0)local c=0
for h,e in v(h)do
c=c+1
n(2,6*c-4,u(e,1,3)..w..a[e])end
j(255,0,0)for h,e in v(h)do
c=c+1
n(2,6*c-2,u(e,1,3)..w.._[e])end
j(0,0,0)c=c+1
n(2,6*c,"Unit")end
function q()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function g()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
