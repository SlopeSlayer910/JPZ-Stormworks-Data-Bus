-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1539 (1935 with comment) chars
E=" = "
D="f"
C="I4"

h=false
q=true
t=screen
s=string
z=s.sub
l=t.drawText
k=t.setColor
i=output.setNumber
w=s.unpack
y=s.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}x=1
c={}c.B=0
c.o=0
c.j=0
e={}e[0]={type=0,f=q}for b=1,125,1 do
e[b]={type=1,f=h}end
e[63]={type=2,f=h}e[126]={type=2,f=h}e[127]={type=3,f=q}function onTick()a.n=input.getNumber(x)a.r=y(D,a.n)a.d=w(C,a.r)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))p()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=0
_[4]=0
_[5]=127
_[6]=a[6]<<7
for A,m in pairs(e)do
if m.f==h and m.type==a[6]then
_[6]=_[6]|A
m.f=q
break
end
end
elseif a[1]==1 then
local o=a[6]&(2^7-1)e[o].f=h
u()end
elseif a[3]==1 then
for b=1,126 do
e[b].f=h
end
u()elseif a[3]==2 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=2
_[4]=127
_[5]=a[4]_[6]=0
elseif a[1]==1 then
p()end
else
p()end
else
u()end
if _[2]==1 then
if c.j>360 then
c.j=0
_[1]=0
_[2]=0
_[3]=1
_[4]=0
_[5]=127
_[6]=0
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.d)_.r=y(C,_.d)_.n=w(D,_.r)i(x,_.n)c.j=c.j+1
i(2,c.B)i(3,c.o)i(4,c.j)end
function onDraw()k(20,20,20)t.drawClear()k(0,255,0)local v=0
for b=1,#g,1 do
l(2,6*b-4,z(g[b],1,3)..E..a[b])end
k(255,0,0)for b=1,#g,1 do
l(2,6*b+#g*6-2,z(g[b],1,3)..E.._[b])end
k(0,0,0)v=#g*2+1
l(2,6*v,"Master Unit")end
function u()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function p()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
