function montecarlo()
    x1 = 0; %lewa sciana
    x2 = 1150; %lewa wneka drzwi
    x3 = 2230; %prawa wneka drzwi
    x4 = 3100; %lewa sciana srodkowej wneki
    x5 = 5070; %prawa sciana srodkowej wneki
    x6 = 7470; %lewa strona malej wneki
    x7 = 7990; %prawa sciana

    y1 = 0; %wneka drzwi
    y2 = 200;%dolna sciana
    y3 = 290; %wneka mala z prawej
    y4 = 2430; %poczatek skosu
    y5 = 3280; %koniec skosu / gorna sciana / poczatek srodkowej wneki
    y6 = 4600; %koniec srodkowej wneki

    z1 = 0; %podloga
    z2 = 1850; %poczatek skosu
    z3 = 1870; %sufit wneki
    z4 = 2600; %sufit
    
    trafienia = 0;
    strzaly = 10000;
    obj_obszaru = x7*y6*z4;
    
    %losowanie punktu
    X = (rand(1,strzaly))*x7;
    Y = (rand(1,strzaly))*y6;
    Z = (rand(1,strzaly))*z4;
    
    for i = 1:strzaly
        %wneka drzwiowa
        if (X(i) >= x2 && X(i) <=x3 && Y(i) >=y1 && Y(i) <= y2 && Z(i) >= z1 && Z(i) <= z4)
            trafienia = trafienia + 1;
            plot3(X(i),Y(i)-1000,Z(i)-4000, 'og');
        %mala wneka
        elseif (X(i) >= x1 && X(i) <=x6 && Y(i) >=y2 && Y(i) <= y3 && Z(i) >= z1 && Z(i) <= z4)
            trafienia = trafienia + 1;
            plot3(X(i),Y(i)-1000,Z(i)-4000, 'og');
        %sala do sufitu / poczatku skosu
        elseif (X(i) >= x1 && X(i) <=x7 && Y(i) >=y3 && Y(i) <= y4 && Z(i) >= z1 && Z(i) <= z4)
            trafienia = trafienia + 1;
            plot3(X(i),Y(i)-1000,Z(i)-4000,'og');
        %skos
        elseif (X(i) >= x1 && X(i) <=x7 && Y(i) >=y4 && Y(i) <= y5 && Z(i) >= z1 &&  Z(i) <= interp2([x7 0], [y4 y5], [z4 z4; z2 z2], X(i), Y(i), 'cubic'))
            trafienia = trafienia + 1;
            plot3(X(i),Y(i)-1000,Z(i)-4000, 'og');
        %wneka srodkowa
        elseif (X(i) >= x4 && X(i) <=x5 && Y(i) >=y5 && Y(i) <= y6 && Z(i) >= z1 && Z(i) <= z3)
            trafienia = trafienia + 1;
            plot3(X(i),Y(i)-1000,Z(i)-4000,'og');
        else
            %nietrafione
            plot3(X(i),Y(i)-1000,Z(i)-4000, 'or');
        end
    end
    trafienia
    objetosc = trafienia / strzaly * obj_obszaru