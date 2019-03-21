% RDM Created 043017, Revised 032119

directory='';
list={};
imsize=512;
sliceno=100;
roisize=64;
checksize=5;
thresh=[110,45,5];

for i=1:length(list)
    
    [V,spatial,dim] = dicomreadVolume(fullfile(strcat(directory,list{i})));
    img=V(:,:,1,sliceno);
    figure
    imshow(img,[0,2000])
    
    [x,y]=ginput(1);
    col=round(x-.5)+.5;
    row=round(y-.5)+.5;
    roi=img(row-roisize/2+.5:row+roisize/2-.5,col-roisize/2+.5:col+roisize/2-.5);
    figure
    imshow(roi,[0,2000])
    
    [x,y]=ginput(1);
    x=int64(x);
    y=int64(y);
    a=roi(y-checksize:y+checksize,x-checksize:x+checksize);
    a=mean(mean(a));
    ind=find(roi>a+300);
    count=length(ind);
    roi(ind)=2;
    disp('CAC Score:')
    if(count>thresh(1))
        disp('3');
    else if(count>thresh(2))
            disp('2');
        else if(count>thresh(3))
                disp('1');
            else
                disp('0');
            end
        end
    end
end
