% RDM Created 043017, Revised 032119

x = zeros(100);
cnt = 0;
while 1
    cnt = cnt+1;
    x(cnt) = input('CAC Score: ');
    if x(cnt)==-1
        break;
    end
end
x = x(1:cnt)
