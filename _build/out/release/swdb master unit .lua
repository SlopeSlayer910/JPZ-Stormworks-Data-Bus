-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1550 (1946 with comment) chars
E="I4"
D=" = "
C="f"

v=pairs
h=false
m=true
p=screen
q=string
z=q.sub
o=p.drawText
k=p.setColor
i=output.setNumber
y=q.unpack
x=q.pack
l={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}w=1
c={}c.B=0
c.s=0
c.j=0
g={}g[0]={type=0,f=m}for b=1,125,1 do
g[b]={type=1,f=h}end
g[63]={type=2,f=h}g[126]={type=2,f=h}g[127]={type=3,f=m}function onTick()a.u=input.getNumber(w)a.n=x(C,a.u)a.d=y(E,a.n)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))t()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=0
_[4]=0
_[5]=127
_[6]=a[6]<<7
for A,e in v(g)do
if e.f==h and e.type==a[6]then
_[6]=_[6]|A
e.f=m
break
end
end
elseif a[1]==1 then
local s=a[6]&(2^7-1)g[s].f=h
r()end
elseif a[3]==1 then
for b=1,126 do
g[b].f=h
end
r()elseif a[3]==2 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=2
_[4]=127
_[5]=a[4]_[6]=0
elseif a[1]==1 then
t()end
else
t()end
else
r()end
if _[2]==1 then
if h and c.j>60 then
c.j=0
_[1]=0
_[2]=0
_[3]=1
_[4]=0
_[5]=127
_[6]=0
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.d)_.n=x(E,_.d)_.u=y(C,_.n)i(w,_.u)c.j=c.j+1
i(2,c.B)i(3,c.s)i(4,c.j)end
function onDraw()k(20,20,20)p.drawClear()k(0,255,0)local b=0
for l,e in v(l)do
b=b+1
o(2,6*b-4,z(e,1,3)..D..a[e])end
k(255,0,0)for l,e in v(l)do
b=b+1
o(2,6*b-2,z(e,1,3)..D.._[e])end
k(0,0,0)b=b+1
o(2,6*b,"Master Unit")end
function r()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function t()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
