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
r=pairs
p=false
q=screen
o=string
B=o.sub
m=q.drawText
l=q.setColor
k=output.setNumber
A=o.unpack
z=o.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}b={}x=1
c={}c.type=2
c.f=-1
g={G={t=p,h=I,C={}}}u={C={},D={"mainType","subType"}}function onTick()a.v=input.getNumber(x)a.n=z(H,a.v)a.e=A(J,a.n)a[_[1]]=(a.e>>31 & 1)a[_[2]]=(a.e>>30 & 1)a[_[3]]=(a.e>>23 &(2^7-1))a[_[4]]=(a.e>>16 &(2^7-1))a[_[5]]=(a.e>>9 &(2^7-1))a[_[6]]=(a.e &(2^9-1))i()if a[_[2]]==0 then
if a[_[3]]==0 then
if a[_[1]]==0 then
i()elseif a[_[1]]==1 then
if(a[_[6]]>>7)==c.type and c.f==-1 then
c.f=a[_[6]]&(2^7-1)for d=1,62,1 do
g[c.f-d]={t=p,h=I}end
s()else
i()end
end
elseif a[_[3]]==1 then
c.f=-1
i()elseif a[_[3]]==2 then
if a[_[1]]==0 then
if c.f==-1 then
b[_[1]]=1
b[_[2]]=0
b[_[3]]=2
b[_[4]]=127
b[_[5]]=a[_[4]]b[_[6]]=127
else
b[_[1]]=1
b[_[2]]=0
b[_[3]]=2
b[_[4]]=c.f
b[_[5]]=a[_[4]]b[_[6]]=0
g[a[_[4]]].t=true
if(a[6]>>7 & 2^2-1)==0 then
g[a[_[4]]].h="weapon"
w(g[a[_[4]]])g[a[_[4]]].E=(a[_[6]]>>4 & 2^3-1)g[a[_[4]]].F=(a[_[6]]& 2^4-1)end
end
elseif a[_[1]]==1 then
if a[_[4]]==c.f then
g[a[_[5]]].t=p
g[a[_[5]]].h=I
w(g[a[_[5]]])s()else
i()end
end
else
i()end
else
s()end
if b[_[2]]==1 then
if c.f==-1 then
b[_[1]]=0
b[_[2]]=0
b[_[3]]=0
b[_[4]]=127
b[_[5]]=0
b[_[6]]=c.type
end
end
b.e=(b[_[1]]<<31|b[_[2]]<<30|b[_[3]]<<23|b[_[4]]<<16|b[_[5]]<<9|b[_[6]])k(1,b.e)b.n=z(J,b.e)b.v=A(H,b.n)k(x,b.v)k(2,c.type)k(3,c.f)end
function onDraw()l(20,20,20)q.drawClear()l(0,255,0)local d=0
for _,j in r(_)do
d=d+1
m(2,(6*d)-4,B(j,1,3)..K..a[j])end
l(255,0,0)for _,j in r(_)do
d=d+1
m(2,(6*d)-2,B(j,1,3)..K..b[j])end
l(0,0,0)d=d+1
m(2,(6*d),"Unit Manager")end
function s()b[_[1]]=0
b[_[2]]=1
b[_[3]]=0
b[_[4]]=0
b[_[5]]=0
b[_[6]]=0
end
function i()b[_[1]]=a[_[1]]b[_[2]]=a[_[2]]b[_[3]]=a[_[3]]b[_[4]]=a[_[4]]b[_[5]]=a[_[5]]b[_[6]]=a[_[6]]end
function w(c)for _,j in r(u)do
if c[_]~=y then
c[_]=y
end
end
c[c.h]={}for d=1,#u[c.h],1 do
c[c.h][u[c.h][d]]=""
end
end
