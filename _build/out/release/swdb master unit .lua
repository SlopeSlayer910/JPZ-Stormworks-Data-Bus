-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1745 (2141 with comment) chars
D="I4"
C=" = "
B="f"

t=pairs
i=false
r=true
u=screen
s=string
y=s.sub
m=u.drawText
l=u.setColor
j=output.setNumber
w=s.unpack
x=s.pack
_={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}b={}a={}z=1
d={}d.type=0
d.q=0
d.k=0
h={}h[0]={type=0,g=r}for c=1,125,1 do
h[c]={type=1,g=i}end
h[63]={type=2,g=i}h[126]={type=2,g=i}h[127]={type=3,g=r}function onTick()b.n=input.getNumber(z)b.o=x(B,b.n)b.e=w(D,b.o)b[_[1]]=(b.e>>31 & 1)b[_[2]]=(b.e>>30 & 1)b[_[3]]=(b.e>>23 &(2^7-1))b[_[4]]=(b.e>>16 &(2^7-1))b[_[5]]=(b.e>>9 &(2^7-1))b[_[6]]=(b.e &(2^9-1))p()if b[_[2]]==0 then
if b[_[3]]==0 then
if b[_[1]]==0 then
a[_[1]]=1
a[_[2]]=0
a[_[3]]=0
a[_[4]]=0
a[_[5]]=127
a[_[6]]=b[_[6]]<<7
for A,f in t(h)do
if f.g==i and f.type==b[_[6]]then
a[_[6]]=a[_[6]]|A
f.g=r
break
end
end
elseif b[_[1]]==1 then
local q=b[_[6]]&(2^7-1)h[q].g=i
v()end
elseif b[_[3]]==1 then
for c=1,126 do
h[c].g=i
end
v()elseif b[_[3]]==2 then
if b[_[1]]==0 then
a[_[1]]=1
a[_[2]]=0
a[_[3]]=2
a[_[4]]=127
a[_[5]]=b[_[4]]a[_[6]]=0
elseif b[_[1]]==1 then
p()end
else
p()end
else
v()end
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
a.e=(a[_[1]]<<31|a[_[2]]<<30|a[_[3]]<<23|a[_[4]]<<16|a[_[5]]<<9|a[_[6]])j(1,a.e)a.o=x(D,a.e)a.n=w(B,a.o)j(z,a.n)d.k=d.k+1
j(2,d.type)j(3,d.q)j(4,d.k)end
function onDraw()l(20,20,20)u.drawClear()l(0,255,0)local c=0
for _,f in t(_)do
c=c+1
m(2,6*c-4,y(f,1,3)..C..b[f])end
l(255,0,0)for _,f in t(_)do
c=c+1
m(2,6*c-2,y(f,1,3)..C..a[f])end
l(0,0,0)c=c+1
m(2,6*c,"Master Unit")end
function v()a[_[1]]=0
a[_[2]]=1
a[_[3]]=0
a[_[4]]=0
a[_[5]]=0
a[_[6]]=0
end
function p()a[_[1]]=b[_[1]]a[_[2]]=b[_[2]]a[_[3]]=b[_[3]]a[_[4]]=b[_[4]]a[_[5]]=b[_[5]]a[_[6]]=b[_[6]]end
