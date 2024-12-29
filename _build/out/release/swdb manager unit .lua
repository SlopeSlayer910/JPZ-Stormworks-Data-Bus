-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1823 (2219 with comment) chars
J="f"
I="I4"
H=" = "

x=nil
m=false
t=screen
n=string
B=n.sub
r=t.drawText
j=t.setColor
k=output.setNumber
w=n.unpack
u=n.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}_={}a={}z=1
b={}b.c=2
b.g=-1
e={C={l=m,c=0,D={}}}o={[0]={},{"mainType","subType"},{"targetNumber","targetX","targetY","targetZ"}}function onTick()_.s=input.getNumber(z)_.p=u(J,_.s)_.f=w(I,_.p)_[1]=(_.f>>31 & 1)_[2]=(_.f>>30 & 1)_[3]=(_.f>>23 &(2^7-1))_[4]=(_.f>>16 &(2^7-1))_[5]=(_.f>>9 &(2^7-1))_[6]=(_.f &(2^9-1))h()if _[2]==0 then
if _[3]==0 then
if _[1]==0 then
h()elseif _[1]==1 then
if(_[6]>>7)==b.c and b.g==-1 then
b.g=_[6]&(2^7-1)for d=1,62,1 do
e[b.g-d]={l=m,c="none"}end
q()else
h()end
end
elseif _[3]==1 then
b.g=-1
e={C={l=m,c=0,D={}}}h()elseif _[3]==2 then
if _[1]==0 then
if b.g==-1 then
a[1]=1
a[2]=0
a[3]=2
a[4]=127
a[5]=_[4]a[6]=127
else
a[1]=1
a[2]=0
a[3]=2
a[4]=b.g
a[5]=_[4]a[6]=0
e[_[4]].l=true
if(_[6]>>7 & 2^2-1)==0 then
e[_[4]].c=1
y(e[_[4]])e[_[4]].G=(_[6]>>4 & 2^3-1)e[_[4]].F=(_[6]& 2^4-1)end
end
elseif _[1]==1 then
if _[4]==b.g then
e[_[5]].l=m
e[_[5]].c=0
y(e[_[5]])q()else
h()end
end
else
h()end
else
q()end
if a[2]==1 then
if b.g==-1 then
a[1]=0
a[2]=0
a[3]=0
a[4]=127
a[5]=0
a[6]=b.c
end
end
a.f=(a[1]<<31|a[2]<<30|a[3]<<23|a[4]<<16|a[5]<<9|a[6])k(1,a.f)a.p=u(I,a.f)a.s=w(J,a.p)k(z,a.s)k(2,b.c)k(3,b.g)end
function onDraw()j(20,20,20)t.drawClear()j(0,255,0)local A=0
for d=1,#i,1 do
r(2,6*d-4,B(i[d],1,3)..H.._[d])end
j(255,0,0)for d=1,#i,1 do
r(2,6*d+#i*6-2,B(i[d],1,3)..H..a[d])end
j(0,0,0)A=#i*2+1
r(2,6*A,"Unit Manager")end
function q()a[1]=0
a[2]=1
a[3]=0
a[4]=0
a[5]=0
a[6]=0
end
function h()a[1]=_[1]a[2]=_[2]a[3]=_[3]a[4]=_[4]a[5]=_[5]a[6]=_[6]end
function y(b)for v,E in pairs(o)do
if b[v]~=x then
b[v]=x
end
end
b[b.c]={}for d=1,#(o[b.c]),1 do
b[b.c][o[b.c][d]]=""
end
end
