-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1660 (2056 with comment) chars
D=" = "
C="I4"
B="f"

o=pairs
i=false
t=true
s=screen
u=string
y=u.sub
r=s.drawText
l=s.setColor
j=output.setNumber
w=u.unpack
z=u.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}v=1
d={}d.type=0
d.q=0
d.k=0
g={}g[0]={type=0,h=t}for c=1,125,1 do
g[c]={type=1,h=i}end
g[63]={type=2,h=i}g[126]={type=2,h=i}g[127]={type=3,h=t}function onTick()b.n=input.getNumber(v)b.p=z(B,b.n)b.e=w(C,b.p)b[_[1]]=(b.e>>31 & 1)b[_[2]]=(b.e>>30 & 1)b[_[3]]=(b.e>>23 &(2^7-1))b[_[4]]=(b.e>>16 &(2^7-1))b[_[5]]=(b.e>>9 &(2^7-1))b[_[6]]=(b.e &(2^9-1))x()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
a[_[1]]=1
a[_[2]]=0
a[_[3]]=0
a[_[4]]=0
a[_[5]]=127
a[_[6]]=b[_[6]]<<7
for A,f in o(g)do
if f.h==i and f.type==b[_[6]]then
a[_[6]]=a[_[6]]|A
f.h=t
break
end
end
elseif b[_[1]]==1 then
local q=b[_[6]]&(2^7-1)g[q].h=i
m()end
elseif b[_[3]]==1 then
for c=1,126 do
g[c].h=i
end
m()elseif b[_[3]]==2 then
for c=1,126 do
g[c].h=i
end
m()else
x()end
else
m()end
if a[_[2]]==1 then
if i and d.k>60 then
d.k=0
a[_[1]]=0
a[_[2]]=0
a[_[3]]=1
a[_[4]]=0
a[_[5]]=127
a[_[6]]=0
end
end
a.e=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])j(1,a.e)a.p=z(C,a.e)a.n=w(B,a.p)j(v,a.n)d.k=d.k+1
j(2,d.type)j(3,d.q)j(4,d.k)end
function onDraw()l(20,20,20)s.drawClear()l(0,255,0)local c=0
for _,f in o(_)do
c=c+1
r(2,6*c-4,y(f,1,3)..D..b[f])end
l(255,0,0)for _,f in o(_)do
c=c+1
r(2,6*c-2,y(f,1,3)..D..a[f])end
l(0,0,0)c=c+1
r(2,6*c,"Master Unit")end
function m()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function x()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
