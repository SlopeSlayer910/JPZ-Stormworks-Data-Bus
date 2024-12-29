-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1823 (2219 with comment) chars
J="I4"
I=" = "
H="f"

A=nil
k=false
s=screen
r=string
x=r.sub
t=s.drawText
j=s.setColor
l=output.setNumber
u=r.unpack
w=r.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}_={}a={}z=1
b={}b.c=2
b.g=-1
e={D={m=k,c=0,C={}}}p={[0]={},{"mainType","subType"},{"targetNumber","targetX","targetY","targetZ"}}function onTick()_.n=input.getNumber(z)_.q=w(H,_.n)_.f=u(J,_.q)_[1]=(_.f>>31 & 1)_[2]=(_.f>>30 & 1)_[3]=(_.f>>23 &(2^7-1))_[4]=(_.f>>16 &(2^7-1))_[5]=(_.f>>9 &(2^7-1))_[6]=(_.f &(2^9-1))h()if _[2]==0 then
if _[3]==0 then
if _[1]==0 then
h()elseif _[1]==1 then
if(_[6]>>7)==b.c and b.g==-1 then
b.g=_[6]&(2^7-1)for d=1,62,1 do
e[b.g-d]={m=k,c="none"}end
o()else
h()end
end
elseif _[3]==1 then
b.g=-1
e={D={m=k,c=0,C={}}}h()elseif _[3]==2 then
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
e[_[4]].m=true
if(_[6]>>7 & 2^2-1)==0 then
e[_[4]].c=1
v(e[_[4]])e[_[4]].G=(_[6]>>4 & 2^3-1)e[_[4]].F=(_[6]& 2^4-1)end
end
elseif _[1]==1 then
if _[4]==b.g then
e[_[5]].m=k
e[_[5]].c=0
v(e[_[5]])o()else
h()end
end
else
h()end
else
o()end
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
a.f=(a[1]<<31|a[2]<<30|a[3]<<23|a[4]<<16|a[5]<<9|a[6])l(1,a.f)a.q=w(J,a.f)a.n=u(H,a.q)l(z,a.n)l(2,b.c)l(3,b.g)end
function onDraw()j(20,20,20)s.drawClear()j(0,255,0)local B=0
for d=1,#i,1 do
t(2,6*d-4,x(i[d],1,3)..I.._[d])end
j(255,0,0)for d=1,#i,1 do
t(2,6*d+#i*6-2,x(i[d],1,3)..I..a[d])end
j(0,0,0)B=#i*2+1
t(2,6*B,"Unit Manager")end
function o()a[1]=0
a[2]=1
a[3]=0
a[4]=0
a[5]=0
a[6]=0
end
function h()a[1]=_[1]a[2]=_[2]a[3]=_[3]a[4]=_[4]a[5]=_[5]a[6]=_[6]end
function v(b)for y,E in pairs(p)do
if b[y]~=A then
b[y]=A
end
end
b[b.c]={}for d=1,#(p[b.c]),1 do
b[b.c][p[b.c][d]]=""
end
end
