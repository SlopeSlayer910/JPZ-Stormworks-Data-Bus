-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1538 (1934 with comment) chars
E="I4"
D=" = "
C="f"

h=false
m=true
o=screen
p=string
z=p.sub
u=o.drawText
k=o.setColor
i=output.setNumber
y=p.unpack
v=p.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}x=1
c={}c.A=0
c.l=0
c.j=0
f={}f[0]={type=0,e=m}for b=1,125,1 do
f[b]={type=1,e=h}end
f[63]={type=2,e=h}f[126]={type=2,e=h}f[127]={type=3,e=m}function onTick()a.q=input.getNumber(x)a.s=v(C,a.q)a.d=y(E,a.s)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))t()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=0
_[4]=0
_[5]=127
_[6]=a[6]<<7
for B,n in pairs(f)do
if n.e==h and n.type==a[6]then
_[6]=_[6]|B
n.e=m
break
end
end
elseif a[1]==1 then
local l=a[6]&(2^7-1)f[l].e=h
r()end
elseif a[3]==1 then
for b=1,126 do
f[b].e=h
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
if c.j>60 then
c.j=0
_[1]=0
_[2]=0
_[3]=1
_[4]=0
_[5]=127
_[6]=0
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.d)_.s=v(E,_.d)_.q=y(C,_.s)i(x,_.q)c.j=c.j+1
i(2,c.A)i(3,c.l)i(4,c.j)end
function onDraw()k(20,20,20)o.drawClear()k(0,255,0)local w=0
for b=1,#g,1 do
u(2,6*b-4,z(g[b],1,3)..D..a[b])end
k(255,0,0)for b=1,#g,1 do
u(2,6*b+#g*6-2,z(g[b],1,3)..D.._[b])end
k(0,0,0)w=#g*2+1
u(2,6*w,"Master Unit")end
function r()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function t()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
