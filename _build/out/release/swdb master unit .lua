-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1454 (1850 with comment) chars
E="f"
D="I4"
C=" = "

h=false
s=true
t=screen
r=string
v=r.sub
u=t.drawText
k=t.setColor
j=output.setNumber
z=r.unpack
w=r.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}x=1
c={}c.A=0
c.p=0
c.i=0
f={}f[0]={type=0,e=s}for b=1,125,1 do
f[b]={type=1,e=h}end
f[63]={type=2,e=h}f[126]={type=2,e=h}f[127]={type=3,e=s}function onTick()a.q=input.getNumber(x)a.n=w(E,a.q)a.d=z(D,a.n)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))o()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=0
_[4]=0
_[5]=127
_[6]=a[6]<<7
for B,l in pairs(f)do
if l.e==h and l.type==a[6]then
_[6]=_[6]|B
l.e=s
break
end
end
elseif a[1]==1 then
local p=a[6]&(2^7-1)f[p].e=h
m()end
elseif a[3]==1 then
for b=1,126 do
f[b].e=h
end
m()elseif a[3]==10 then
o()else
o()end
else
m()end
if _[2]==1 then
if c.i>600 then
c.i=0
_[1]=0
_[2]=0
_[3]=1
_[4]=0
_[5]=127
_[6]=0
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])j(1,_.d)_.n=w(D,_.d)_.q=z(E,_.n)j(x,_.q)c.i=c.i+1
j(2,c.A)j(3,c.p)j(4,c.i)end
function onDraw()k(20,20,20)t.drawClear()k(0,255,0)local y=0
for b=1,#g,1 do
u(2,6*b-4,v(g[b],1,3)..C..a[b])end
k(255,0,0)for b=1,#g,1 do
u(2,6*b+#g*6-2,v(g[b],1,3)..C.._[b])end
k(0,0,0)y=#g*2+1
u(2,6*y,"Master Unit")end
function m()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function o()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
