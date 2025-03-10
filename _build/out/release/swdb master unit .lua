-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1454 (1850 with comment) chars
E="f"
D=" = "
C="I4"

g=false
p=true
n=screen
l=string
z=l.sub
m=n.drawText
k=n.setColor
i=output.setNumber
x=l.unpack
y=l.pack
h={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}w=1
c={}c.A=0
c.o=0
c.j=0
f={}f[0]={type=0,e=p}for b=1,125,1 do
f[b]={type=1,e=g}end
f[63]={type=2,e=g}f[126]={type=2,e=g}f[127]={type=3,e=p}function onTick()a.u=input.getNumber(w)a.t=y(E,a.u)a.d=x(C,a.t)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))r()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
_[1]=1
_[2]=0
_[3]=0
_[4]=0
_[5]=127
_[6]=a[6]<<7
for B,q in pairs(f)do
if q.e==g and q.type==a[6]then
_[6]=_[6]|B
q.e=p
break
end
end
elseif a[1]==1 then
local o=a[6]&(2^7-1)f[o].e=g
s()end
elseif a[3]==1 then
for b=1,126 do
f[b].e=g
end
s()elseif a[3]==10 then
r()else
r()end
else
s()end
if _[2]==1 then
if c.j>600 then
c.j=0
_[1]=0
_[2]=0
_[3]=1
_[4]=0
_[5]=127
_[6]=0
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.d)_.t=y(C,_.d)_.u=x(E,_.t)i(w,_.u)c.j=c.j+1
i(2,c.A)i(3,c.o)i(4,c.j)end
function onDraw()k(20,20,20)n.drawClear()k(0,255,0)local v=0
for b=1,#h,1 do
m(2,6*b-4,z(h[b],1,3)..D..a[b])end
k(255,0,0)for b=1,#h,1 do
m(2,6*b+#h*6-2,z(h[b],1,3)..D.._[b])end
k(0,0,0)v=#h*2+1
m(2,6*v,"Master Unit")end
function s()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function r()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
