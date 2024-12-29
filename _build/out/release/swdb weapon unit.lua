-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1544 (1940 with comment) chars
D=" = "
C="f"
B="I4"

m=screen
r=string
t=r.sub
q=m.drawText
j=m.setColor
h=output.setNumber
v=r.unpack
y=r.pack
x=property.getNumber
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}u=1
b={}b.p=1
b.d=-1
b.i=-1
b.l={}b.l.z=x("Main Type")b.l.A=x("Sub Type")b.k=0
function onTick()a.o=input.getNumber(u)a.s=y(C,a.o)a.c=v(B,a.s)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.p and b.d==-1 and(a[6]& 2^7-1)>0
then
b.d=a[6]&(2^7-1)n()else
f()end
end
elseif a[3]==1 then
b.d=-1
b.i=-1
f()elseif a[3]==2 then
if a[1]==0 then
f()elseif a[1]==1 then
if a[5]==b.d then
if a[4]==127 then
b.i=-1
else
b.i=a[4]end
n()else
f()end
end
else
f()end
else
n()end
if _[2]==1 then
if b.d==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.p
elseif b.i==-1 and b.k>30 then
b.k=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.d
_[5]=127
_[6]=(b.l.z &(2^3-1)<<4)|(b.l.A &(2^4-1))elseif false then
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.s=y(B,_.c)_.o=v(C,_.s)h(u,_.o)b.k=b.k+1
h(2,b.p)h(3,b.d)h(4,b.i)end
function onDraw()j(20,20,20)m.drawClear()j(0,255,0)local w=0
for e=1,#g,1 do
q(2,6*e-4,t(g[e],1,3)..D..a[e])end
j(255,0,0)for e=1,#g,1 do
q(2,6*e+#g*6-2,t(g[e],1,3)..D.._[e])end
j(0,0,0)w=#g*2+1
q(2,6*w,"Weapon")end
function n()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
