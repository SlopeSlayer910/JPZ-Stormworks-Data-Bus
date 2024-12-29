-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1538 (1934 with comment) chars
E="f"
D=" = "
C="I4"

g=false
u=true
o=screen
r=string
z=r.sub
p=o.drawText
k=o.setColor
j=output.setNumber
y=r.unpack
x=r.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}w=1
c={}c.A=0
c.n=0
c.i=0
e={}e[0]={type=0,f=u}for b=1,125,1 do
e[b]={type=1,f=g}end
e[63]={type=2,f=g}e[126]={type=2,f=g}e[127]={type=3,f=u}function onTick()a.t=input.getNumber(w)a.q=x(E,a.t)a.d=y(C,a.q)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))m()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=0
_[4]=0
_[5]=127
_[6]=a[6]<<7
for B,l in pairs(e)do
if l.f==g and l.type==a[6]then
_[6]=_[6]|B
l.f=u
break
end
end
elseif a[1]==1 then
local n=a[6]&(2^7-1)e[n].f=g
s()end
elseif a[3]==1 then
for b=1,126 do
e[b].f=g
end
s()elseif a[3]==2 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=2
_[4]=127
_[5]=a[4]_[6]=0
elseif a[1]==1 then
m()end
else
m()end
else
s()end
if _[2]==1 then
if c.i>60 then
c.i=0
_[1]=0
_[2]=0
_[3]=1
_[4]=0
_[5]=127
_[6]=0
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])j(1,_.d)_.q=x(C,_.d)_.t=y(E,_.q)j(w,_.t)c.i=c.i+1
j(2,c.A)j(3,c.n)j(4,c.i)end
function onDraw()k(20,20,20)o.drawClear()k(0,255,0)local v=0
for b=1,#h,1 do
p(2,6*b-4,z(h[b],1,3)..D..a[b])end
k(255,0,0)for b=1,#h,1 do
p(2,6*b+#h*6-2,z(h[b],1,3)..D.._[b])end
k(0,0,0)v=#h*2+1
p(2,6*v,"Master Unit")end
function s()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function m()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
