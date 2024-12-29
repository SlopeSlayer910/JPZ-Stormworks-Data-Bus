-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1156 (1552 with comment) chars
y=" = "
x="f"
w="I4"

s=pairs
m=screen
n=string
q=n.sub
p=m.drawText
j=m.setColor
h=output.setNumber
r=n.unpack
t=n.pack
i={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}u=1
b={}b.o=1
b.g=-1
function onTick()a.l=input.getNumber(u)a.k=t(x,a.l)a.c=r(w,a.k)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))e()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
e()elseif a[1]==1 then
if(a[6]>>7)==b.o and b.g==-1 then
b.g=a[6]&(2^7-1)v()else
e()end
end
elseif a[3]==1 then
b.g=-1
e()else
e()end
else
v()end
if _[2]==1 then
if b.g==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.o
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])h(1,_.c)_.k=t(w,_.c)_.l=r(x,_.k)h(u,_.l)h(2,b.o)h(3,b.g)end
function onDraw()j(20,20,20)m.drawClear()j(0,255,0)local d=0
for i,f in s(i)do
d=d+1
p(2,6*d-4,q(f,1,3)..y..a[f])end
j(255,0,0)for i,f in s(i)do
d=d+1
p(2,6*d-2,q(f,1,3)..y.._[f])end
j(0,0,0)d=d+1
p(2,6*d,"Unit")end
function v()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function e()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
