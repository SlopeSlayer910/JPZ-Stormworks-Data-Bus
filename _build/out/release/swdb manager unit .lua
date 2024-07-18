-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 2005 (2401 with comment) chars
K=" = "
J="I4"
I="none"
H="f"

y=nil
u=pairs
t=false
s=screen
v=string
w=v.sub
q=s.drawText
k=s.setColor
l=output.setNumber
A=v.unpack
x=v.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}b={}z=1
c={}c.type=2
c.g=-1
e={D={o=t,h=I,C={}}}p={C={},E={"mainType","subType"}}function onTick()a.m=input.getNumber(z)a.n=x(H,a.m)a.f=A(J,a.n)a[_[1]]=(a.f>>31 & 1)a[_[2]]=(a.f>>30 & 1)a[_[3]]=(a.f>>23 &(2^7-1))a[_[4]]=(a.f>>16 &(2^7-1))a[_[5]]=(a.f>>9 &(2^7-1))a[_[6]]=(a.f &(2^9-1))i()if a[_[2]]==0 then
if a[_[3]]==0 then
if a[_[1]]==0 then
i()elseif a[_[1]]==1 then
if(a[_[6]]>>7)==c.type and c.g==-1 then
c.g=a[_[6]]&(2^7-1)for d=1,62,1 do
e[c.g-d]={o=t,h=I}end
r()else
i()end
end
elseif a[_[3]]==1 then
c.g=-1
i()elseif a[_[3]]==2 then
if a[_[1]]==0 then
if c.g==-1 then
b[_[1]]=1
b[_[2]]=0
b[_[3]]=2
b[_[4]]=127
b[_[5]]=a[_[4]]b[_[6]]=127
else
b[_[1]]=1
b[_[2]]=0
b[_[3]]=2
b[_[4]]=c.g
b[_[5]]=a[_[4]]b[_[6]]=0
e[a[_[4]]].o=true
if(a[6]>>7 & 2^2-1)==0 then
e[a[_[4]]].h="weapon"
B(e[a[_[4]]])e[a[_[4]]].G=(a[_[6]]>>4 & 2^3-1)e[a[_[4]]].F=(a[_[6]]& 2^4-1)end
end
elseif a[_[1]]==1 then
if a[_[4]]==c.g then
e[a[_[5]]].o=t
e[a[_[5]]].h=I
B(e[a[_[5]]])r()else
i()end
end
else
i()end
else
r()end
if b[_[2]]==1 then
if c.g==-1 then
b[_[1]]=0
b[_[2]]=0
b[_[3]]=0
b[_[4]]=127
b[_[5]]=0
b[_[6]]=c.type
end
end
b.f=(b[_[1]]<<31|b[_[2]]<<30|b[_[3]]<<23|b[_[4]]<<16|b[_[5]]<<9|b[_[6]])l(1,b.f)b.n=x(J,b.f)b.m=A(H,b.n)l(z,b.m)l(2,c.type)l(3,c.g)end
function onDraw()k(20,20,20)s.drawClear()k(0,255,0)local d=0
for _,j in u(_)do
d=d+1
q(2,(6*d)-4,w(j,1,3)..K..a[j])end
k(255,0,0)for _,j in u(_)do
d=d+1
q(2,(6*d)-2,w(j,1,3)..K..b[j])end
k(0,0,0)d=d+1
q(2,(6*d),"Unit Manager")end
function r()b[_[1]]=0
b[_[2]]=1
b[_[3]]=0
b[_[4]]=0
b[_[5]]=0
b[_[6]]=0
end
function i()b[_[1]]=a[_[1]]b[_[2]]=a[_[2]]b[_[3]]=a[_[3]]b[_[4]]=a[_[4]]b[_[5]]=a[_[5]]b[_[6]]=a[_[6]]end
function B(c)for _,j in u(p)do
if c[_]~=y then
c[_]=y
end
end
c[c.h]={}for d=1,#p[c.h],1 do
c[c.h][p[c.h][d]]=""
end
end
