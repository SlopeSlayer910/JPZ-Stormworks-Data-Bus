-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1550 (1946 with comment) chars
G="f"
F=" = "
E="I4"

A=false
x=true
r=screen
s=string
y=s.sub
q=r.drawText
l=r.setColor
i=output.setNumber
z=s.unpack
w=s.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}u=1
b={}b.p=1
b.d=-1
b.k=-1
b.n=x
b.h=-1
j={}j.D="SAM"
j.B=1
j.C=1
function onTick()a.o=input.getNumber(u)a.t=w(G,a.o)a.c=z(E,a.t)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.p and b.d==-1 then
b.d=a[6]&(2^7-1)m()else
f()end
end
elseif a[3]==1 then
b.d=-1
b.k=-1
f()elseif a[3]==10 then
if a[1]==0 then
if a[4]==b.d then
b.n=A
m()else
f()end
elseif a[1]==1 then
b.n=x
if a[5]==b.d then
if a[4]~=127 then
b.k=a[4]else
b.k=-1
end
m()else
f()end
end
else
f()end
else
m()end
if _[2]==1 then
if b.d==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.p
elseif b.k==-1 and((b.h>30 and b.n)or(b.h>120 and b.n==A))then
b.h=0
_[1]=0
_[2]=0
_[3]=10
_[4]=b.d
_[5]=127
_[6]=j.B<<4|j.C
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.c)_.t=w(E,_.c)_.o=z(G,_.t)i(u,_.o)b.h=b.h+1
i(2,b.p)i(3,b.d)i(4,b.k)i(5,b.h)end
function onDraw()l(20,20,20)r.drawClear()l(0,255,0)local v=0
for e=1,#g,1 do
q(2,6*e-4,y(g[e],1,3)..F..a[e])end
l(255,0,0)for e=1,#g,1 do
q(2,6*e+#g*6-2,y(g[e],1,3)..F.._[e])end
l(0,0,0)v=#g*2+1
q(2,6*v,"Launcher")end
function m()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
