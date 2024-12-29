-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1544 (1940 with comment) chars
D="I4"
C="f"
B=" = "

m=screen
s=string
v=s.sub
p=m.drawText
k=m.setColor
h=output.setNumber
y=s.unpack
x=s.pack
w=property.getNumber
g={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}u=1
b={}b.n=1
b.e=-1
b.i=-1
b.l={}b.l.A=w("Main Type")b.l.z=w("Sub Type")b.j=0
function onTick()a.o=input.getNumber(u)a.r=x(C,a.o)a.c=y(D,a.r)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))f()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
f()elseif a[1]==1 then
if(a[6]>>7)==b.n and b.e==-1 and(a[6]& 2^7-1)>0
then
b.e=a[6]&(2^7-1)q()else
f()end
end
elseif a[3]==1 then
b.e=-1
b.i=-1
f()elseif a[3]==2 then
if a[1]==0 then
f()elseif a[1]==1 then
if a[5]==b.e then
if a[4]==127 then
b.i=-1
else
b.i=a[4]end
q()else
f()end
end
else
f()end
else
q()end
if _[2]==1 then
if b.e==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.n
elseif b.i==-1 and b.j>10 then
b.j=0
_[1]=0
_[2]=0
_[3]=2
_[4]=b.e
_[5]=127
_[6]=(b.l.A &(2^3-1)<<4)|(b.l.z &(2^4-1))elseif false then
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.r=x(D,_.c)_.o=y(C,_.r)h(u,_.o)b.j=b.j+1
h(2,b.n)h(3,b.e)h(4,b.i)end
function onDraw()k(20,20,20)m.drawClear()k(0,255,0)local t=0
for d=1,#g,1 do
p(2,6*d-4,v(g[d],1,3)..B..a[d])end
k(255,0,0)for d=1,#g,1 do
p(2,6*d+#g*6-2,v(g[d],1,3)..B.._[d])end
k(0,0,0)t=#g*2+1
p(2,6*t,"Weapon")end
function q()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function f()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
