program test;
uses crt,graph,venbuton,mouse2;
var gd,gm,i,q,r,j:integer;
    s,s1:string;

begin
     gd:=detect;
     initgraph(gd,  gm,'');
     cleardevice;
     setbkcolor(14);
     s:='(x+2)^2 +2x +1';


              SetTextStyle(DefaultFont, HorizDir, 3);
              q:=pos('^',s);
              s1:=copy(s,1,q-1);
              outtext(s1);
              delete(s,1,q);
              q:=pos(' ',s);
              settextstyle(defaultfont, horizdir,2);
              s1:=copy(s,1,q);
              outtext(s1);
     readkey;
     closegraph;
end.