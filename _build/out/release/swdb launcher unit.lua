-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1160 (1556 with comment) chars
y="f"
x="I4"
w=" = "

r=pairs
k=screen
j=string
q=j.sub
p=k.drawText
i=k.setColor
h=output.setNumber
v=j.unpack
u=j.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}s=1
c={}c.o=1
c.e=-1
function onTick()a.n=input.getNumber(s)a.m=u(y,a.n)a.d=v(x,a.m)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==c.o and c.e==-1 then
c.e=a[6]&(2^7-1)t()else
f()end
end
elseif a[3]==0 then
c.e=-1
f()else
f()end
else
t()end
if _[2]==1 then
if c.e==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=c.o
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.d)_.m=u(x,_.d)_.n=v(y,_.m)h(s,_.n)h(2,c.o)h(3,c.e)end
function onDraw()i(20,20,20)k.drawClear()i(0,255,0)local b=0
for g,l in r(g)do
b=b+1
p(2,6*b-4,q(l,1,3)..w..a[b])end
i(255,0,0)for g,l in r(g)do
b=b+1
p(2,6*b-2,q(l,1,3)..w.._[b])end
i(0,0,0)b=b+1
p(2,6*b,"Launcher")end
function t()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
