-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1634 (2030 with comment) chars
D="f"
C=" = "
B="I4"

z=true
r=false
q=screen
o=string
v=o.sub
n=q.drawText
k=q.setColor
i=output.setNumber
x=o.unpack
w=o.pack
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}u=1
b={}b.j=2
b.c=-1
f={}l=0
t={[0]={[0]=r,0},{[0]=z,1,-1,-1,"",-1},{[0]=z,1,-1,r,0,0,0}}function onTick()a.m=input.getNumber(u)a.s=w(D,a.m)a.d=x(B,a.s)a[1]=(a.d>>31 & 1)a[2]=(a.d>>30 & 1)a[3]=(a.d>>23 &(2^7-1))a[4]=(a.d>>16 &(2^7-1))a[5]=(a.d>>9 &(2^7-1))a[6]=(a.d &(2^9-1))h()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
h()elseif a[1]==1 then
if(a[6]>>7)==b.j and b.c==-1 then
b.c=a[6]&(2^7-1)for e=1,62,1 do
f[b.c-e]={A=r,j="none"}end
p()else
h()end
end
elseif a[3]==1 then
b.c=-1
f={}l=0
h()elseif a[3]==10 then
if a[1]==0 then
if b.c==-1 then
_[1]=1
_[2]=0
_[3]=10
_[4]=127
_[5]=a[4]_[6]=127
else
_[1]=1
_[2]=0
_[3]=10
_[4]=b.c
_[5]=a[4]_[6]=0
l=l+1
if(a[6]>>7 & 2^2-1)==0 then
f[a[4]]=t[1]f[a[4]][2]=(a[6]>>4 & 2^3-1)f[a[4]][3]=(a[6]& 2^4-1)else
f=f-1
end
end
elseif a[1]==1 then
if a[4]==b.c then
f[a[5]]=t[0]p()else
h()end
end
else
h()end
else
p()end
if _[2]==1 then
if b.c==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.j
end
end
_.d=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.d)_.s=w(B,_.d)_.m=x(D,_.s)i(u,_.m)i(2,b.j)i(3,b.c)i(4,l)end
function onDraw()k(20,20,20)q.drawClear()k(0,255,0)local y=0
for e=1,#g,1 do
n(2,6*e-4,v(g[e],1,3)..C..a[e])end
k(255,0,0)for e=1,#g,1 do
n(2,6*e+#g*6-2,v(g[e],1,3)..C.._[e])end
k(0,0,0)y=#g*2+1
n(2,6*y,"Unit Manager")end
function p()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function h()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
