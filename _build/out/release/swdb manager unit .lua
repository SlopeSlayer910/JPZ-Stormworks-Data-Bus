-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 2005 (2401 with comment) chars
K=" = "
J="none"
I="I4"
H="f"

z=nil
t=pairs
p=false
n=screen
o=string
w=o.sub
m=n.drawText
k=n.setColor
l=output.setNumber
x=o.unpack
B=o.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}b={}y=1
c={}c.type=2
c.e=-1
g={G={v=p,h=J,C={}}}q={C={},F={"mainType","subType"}}function onTick()a.u=input.getNumber(y)a.r=B(H,a.u)a.f=x(I,a.r)a[_[1]]=(a.f>>31 & 1)a[_[2]]=(a.f>>30 & 1)a[_[3]]=(a.f>>23 &(2^7-1))a[_[4]]=(a.f>>16 &(2^7-1))a[_[5]]=(a.f>>9 &(2^7-1))a[_[6]]=(a.f &(2^9-1))j()if a[_[2]]==0 then
if a[_[3]]==0 then
if a[_[1]]==0 then
j()elseif a[_[1]]==1 then
if(a[_[6]]>>7)==c.type and c.e==-1 then
c.e=a[_[6]]&(2^7-1)for d=1,62,1 do
g[c.e-d]={v=p,h=J}end
s()else
j()end
end
elseif a[_[3]]==1 then
c.e=-1
j()elseif a[_[3]]==2 then
if a[_[1]]==0 then
if c.e==-1 then
b[_[1]]=1
b[_[2]]=0
b[_[3]]=2
b[_[4]]=127
b[_[5]]=a[_[4]]b[_[6]]=127
else
b[_[1]]=1
b[_[2]]=0
b[_[3]]=2
b[_[4]]=c.e
b[_[5]]=a[_[4]]b[_[6]]=0
g[a[_[4]]].v=true
if(a[6]>>7 & 2^2-1)==0 then
g[a[_[4]]].h="weapon"
A(g[a[_[4]]])g[a[_[4]]].D=(a[_[6]]>>4 & 2^3-1)g[a[_[4]]].E=(a[_[6]]& 2^4-1)end
end
elseif a[_[1]]==1 then
if a[_[4]]==c.e then
g[a[_[5]]].v=p
g[a[_[5]]].h=J
A(g[a[_[5]]])s()else
j()end
end
else
j()end
else
s()end
if b[_[2]]==1 then
if c.e==-1 then
b[_[1]]=0
b[_[2]]=0
b[_[3]]=0
b[_[4]]=127
b[_[5]]=0
b[_[6]]=c.type
end
end
b.f=(b[_[1]]<<31|b[_[2]]<<30|b[_[3]]<<23|b[_[4]]<<16|b[_[5]]<<9|b[_[6]])l(1,b.f)b.r=B(I,b.f)b.u=x(H,b.r)l(y,b.u)l(2,c.type)l(3,c.e)end
function onDraw()k(20,20,20)n.drawClear()k(0,255,0)local d=0
for _,i in t(_)do
d=d+1
m(2,(6*d)-4,w(i,1,3)..K..a[i])end
k(255,0,0)for _,i in t(_)do
d=d+1
m(2,(6*d)-2,w(i,1,3)..K..b[i])end
k(0,0,0)d=d+1
m(2,(6*d),"Unit Manager")end
function s()b[_[1]]=0
b[_[2]]=1
b[_[3]]=0
b[_[4]]=0
b[_[5]]=0
b[_[6]]=0
end
function j()b[_[1]]=a[_[1]]b[_[2]]=a[_[2]]b[_[3]]=a[_[3]]b[_[4]]=a[_[4]]b[_[5]]=a[_[5]]b[_[6]]=a[_[6]]end
function A(c)for _,i in t(q)do
if c[_]~=z then
c[_]=z
end
end
c[c.h]={}for d=1,#q[c.h],1 do
c[c.h][q[c.h][d]]=""
end
end
