-- Author: SlopeSlayer910
-- GitHub: https://github.com/SlopeSlayer910
-- Workshop: https://steamcommunity.com/profiles/76561198890501264/myworkshopfiles/
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 1150 (1546 with comment) chars
x="I4"
w=" = "
v="f"

o=screen
l=string
p=l.sub
m=o.drawText
h=o.setColor
i=output.setNumber
u=l.unpack
s=l.pack
e={"returnFlag","busFreeFlag","instruction","senderAddr","recieverAddr","data"}a={}_={}t=1
b={}b.n=1
b.f=-1
function onTick()a.k=input.getNumber(t)a.j=s(v,a.k)a.c=u(x,a.j)a[1]=(a.c>>31 & 1)a[2]=(a.c>>30 & 1)a[3]=(a.c>>23 &(2^7-1))a[4]=(a.c>>16 &(2^7-1))a[5]=(a.c>>9 &(2^7-1))a[6]=(a.c &(2^9-1))g()if a[2]==0 then
if a[3]==0 then
if a[1]==0 then
g()elseif a[1]==1 then
if(a[6]>>7)==b.n and b.f==-1 then
b.f=a[6]&(2^7-1)q()else
g()end
end
elseif a[3]==1 then
b.f=-1
g()else
g()end
else
q()end
if _[2]==1 then
if b.f==-1 then
_[1]=0
_[2]=0
_[3]=0
_[4]=127
_[5]=0
_[6]=b.n
end
end
_.c=(_[1]<<31|_[2]<<30|_[3]<<23|_[4]<<16|_[5]<<9|_[6])i(1,_.c)_.j=s(x,_.c)_.k=u(v,_.j)i(t,_.k)i(2,b.n)i(3,b.f)end
function onDraw()h(20,20,20)o.drawClear()h(0,255,0)local r=0
for d=1,#e,1 do
m(2,6*d-4,p(e[d],1,3)..w..a[d])end
h(255,0,0)for d=1,#e,1 do
m(2,6*d+#e*6-2,p(e[d],1,3)..w.._[d])end
h(0,0,0)r=#e*2+1
m(2,6*r,"Launcher")end
function q()_[1]=0
_[2]=1
_[3]=0
_[4]=0
_[5]=0
_[6]=0
end
function g()_[1]=a[1]_[2]=a[2]_[3]=a[3]_[4]=a[4]_[5]=a[5]_[6]=a[6]end
