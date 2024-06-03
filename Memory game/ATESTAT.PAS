program atestat;
uses crt,venbuton,mouse2,graph,dos;

const    cu1=14;cu2=12;
var  opt,xm,ym,i,j,gd,gm,lat:integer; start,iesire:button;
   b:array[1..10,1..10] of button;
  k,f,nr,l,c,l2,c2:integer;
  sem,sem2,sem3:boolean; s:string;

procedure init;
begin
  gd:=detect;
  initgraph(gd, gm,'');
end;

procedure joc;
 procedure Moves (var f:integer);
   var s:string;
     Begin
       mouseoff;
       settextstyle(0,0,3);
       setlinestyle(0,0,3);
       setfillstyle(1,2);
       bar(530,330,640,390);
       setcolor(1);
       line(541,335,629,335);
       line(541,385,629,385);
       line(541,335,541,385);
       line(629,335,629,385);
       str(f,s);
       outtextxy(580,80,'T');
       outtextxy(580,120,'R');
       outtextxy(580,160,'I');
       outtextxy(580,200,'A');
       outtextxy(580,240,'L');
       outtextxy(580,280,'S');
       outtextxy(550,350,S);
       setlinestyle(0,0,1);
       settextstyle(0,0,1);
       setcolor(2);
       mouseon;
     end;
   Begin
       definire_buton(iesire,610,1,640,30,1,12,'x');
    pune_buton(iesire);
    k:=0;
       repeat
         moves(f);
         sem2:=false;
        repeat
           for i:=1 to nr do
             for j:=1 to nr do
                if buton_apasat(b[i,j]) and (b[i,j].bcolor=14) and
                   (b[i,j].tcolor=cu1)
                   then
                       begin
                          f:=f+1;
                          l:=i;
                          c:=j;
                          sem2:=true;
                      end;

                 If buton_apasat(iesire) then halt;

         until sem2;

         b[l,c].tcolor:=cu2;
                pune_buton(b[l,c]);


        sem2:=false;
        repeat
           for i:=1 to nr do
             for j:=1 to nr do
                if buton_apasat(b[i,j]) and (b[i,j].bcolor=14) and
                 (b[i,j].tcolor=cu1)
                   then
                       begin
                          l2:=i;
                          c2:=j;
                          sem2:=true;
                      end;
                 If buton_apasat(iesire) then halt;
         until sem2;
         b[l2,c2].tcolor:=cu2;
                pune_buton(b[l2,c2]);

          delay(100);
         if  b[l,c].t=b[l2,c2].t then
            begin

                b[l,c].bcolor:=1;
                pune_buton(b[l,c]);
                b[l2,c2].bcolor:=1;
                pune_buton(b[l2,c2]);
         k:=k+1;
            end
            else
            begin

                  b[l2,c2].tcolor:=cu1;
                pune_buton(b[l2,c2]);
                   b[l,c].tcolor:=cu1;
                pune_buton(b[l,c]);
            end;
    until k>=nr*nr div 2;
      f:=0;
   end;
procedure def;

var x,y,i,j:integer;
c:char;
begin
  lat:=450 div nr;
   y:=25;
   for i:=1 to nr do
     begin
        x:=70;
        for j:=1 to nr do
        begin
           definire_buton(b[i,j],x+2,y+2,x+lat,y+lat,14,cu1,'');
           pune_buton(b[i,j]);
           x:=x+lat;
        end;
        y:=y+lat;
    end;
    c:='A';

    for i:=1 to nr*nr div 2 do
       begin
          repeat
              x:=1+random(nr);
              y:=1+random(nr);
          until  b[x,y].t='';
          b[x,y].t:=c;
         rePeat
              x:=1+random(nr);
              y:=1+random(nr);
          until  b[x,y].t='';
          b[x,y].t:=C;
         c:=succ(c);
     end;
     for i:=1 to nr do
      for j:=1 to nr do
        pune_buton(b[i,j]);
end;


Procedure game;
var level:byte; s1:string;
begin
  nr:=4;
  level:=1;
 setbkcolor(2);
      cleardevice;
        settextstyle(0,0,1);
          outtextxy(250,10,'MEMORY BLOCKS');
          mouseon;
        def;
                mouseoff;
       settextstyle(0,0,3);
       setfillstyle(1,2);
       bar(10,100,40,370);
       setcolor(1);
       str(level,s1);
       outtextxy(20,120,'L');
       outtextxy(20,160,'E');
       outtextxy(20,200,'V');
       outtextxy(20,240,'E');
       outtextxy(20,280,'L');
       outtextxy(20,350,s1);
       settextstyle(0,0,1);
       setcolor(2);
       mouseon;
        joc;
      repeat
        nr:=nr+2;
        def;
        inc(level);
        mouseoff;
       settextstyle(0,0,3);
       setfillstyle(1,2);
       bar(10,100,40,370);
       setcolor(1);
       str(level,s1);
       outtextxy(20,120,'L');
       outtextxy(20,160,'E');
       outtextxy(20,200,'V');
       outtextxy(20,240,'E');
       outtextxy(20,280,'L');
       outtextxy(20,350,s1);
       setlinestyle(0,0,1);
       settextstyle(0,0,1);
       setcolor(2);
       mouseon;
        joc;

      until nr=8;
      IF nr=8 then halt ;


end;

procedure fata;
var i,j:integer; b1,b2:button;
begin
    setbkcolor(1);
    mouseon;
    buton(b1,250,200,380,230,yellow,blue,'START JOC');
    pune_buton(b1);
    buton(b2,250,235,380,265,yellow,blue,'EXIT');
    pune_buton(b2);
    settextstyle(0,0,1);
    setcolor(15);
    outtextxy(100,470,'Proiect realizat de Onet Rares-Nicolae, clasa a 12-a A');
    settextstyle(10,0,5);
    outtextxy(50,70,'MEMORY BLOCKS');
    setcolor(1);
    settextstyle(0,0,1);
    repeat
    mouseon;
    If buton_apasat(b1) then
      begin
           cleardevice;
           game;
      end;
    IF buton_apasat(b2) then halt;
    until (buton_apasat(b2)) or (buton_apasat(b1));
    mouseoff;
end;
begin
randomize;
init;
nr:=4;
fata;
leftbutton;
end.

