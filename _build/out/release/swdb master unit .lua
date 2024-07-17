-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1660 (2056 with comment) chars
D="I4"
C=" = "
B="f"

q=pairs
i=false
n=true
t=screen
r=string
v=r.sub
u=t.drawText
m=t.setColor
k=output.setNumber
z=r.unpack
x=r.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}w=1
d={}d.type=0
d.s=0
d.j=0
g={}g[0]={type=0,e=n}for c=1,125,1 do
g[c]={type=1,e=i}end
g[63]={type=2,e=i}g[126]={type=2,e=i}g[127]={type=3,e=n}function onTick()b.o=input.getNumber(w)b.p=x(B,b.o)b.h=z(D,b.p)b[_[1]]=(b.h>>31 & 1)b[_[2]]=(b.h>>30 & 1)b[_[3]]=(b.h>>23 &(2^7-1))b[_[4]]=(b.h>>16 &(2^7-1))b[_[5]]=(b.h>>9 &(2^7-1))b[_[6]]=(b.h &(2^9-1))y()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
a[_[1]]=1
a[_[2]]=0
a[_[3]]=0
a[_[4]]=0
a[_[5]]=127
a[_[6]]=b[_[6]]<<7
for A,f in q(g)do
if f.e==i and f.type==b[_[6]]then
a[_[6]]=a[_[6]]|A
f.e=n
break
end
end
elseif b[_[1]]==1 then
local s=b[_[6]]&(2^7-1)g[s].e=i
l()end
elseif b[_[3]]==1 then
for c=1,126 do
g[c].e=i
end
l()elseif b[_[3]]==2 then
for c=1,126 do
g[c].e=i
end
l()else
y()end
else
l()end
if a[_[2]]==1 then
if i and d.j>60 then
d.j=0
a[_[1]]=0
a[_[2]]=0
a[_[3]]=1
a[_[4]]=0
a[_[5]]=127
a[_[6]]=0
end
end
a.h=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])k(1,a.h)a.p=x(D,a.h)a.o=z(B,a.p)k(w,a.o)d.j=d.j+1
k(2,d.type)k(3,d.s)k(4,d.j)end
function onDraw()m(20,20,20)t.drawClear()m(0,255,0)local c=0
for _,f in q(_)do
c=c+1
u(2,6*c-4,v(f,1,3)..C..b[f])end
m(255,0,0)for _,f in q(_)do
c=c+1
u(2,6*c-2,v(f,1,3)..C..a[f])end
m(0,0,0)c=c+1
u(2,6*c,"Master Unit")end
function l()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function y()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
