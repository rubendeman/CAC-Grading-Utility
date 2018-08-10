directory='';
list={};
sliceno=107;
for i=1:length(list)
    
[V,spatial,dim] = dicomreadVolume(fullfile(strcat(directory,list{i})));
img=V(:,:,1,sliceno);
figure
imshow(img,[0,2000])

imsize=512;
roisize=64;
[x,y]=ginput(1);
col=round(x-.5)+.5;
row=round(y-.5)+.5;
roi=img(row-roisize/2+.5:row+roisize/2-.5,col-roisize/2+.5:col+roisize/2-.5);
figure
imshow(roi,[0,2000])

[x,y]=ginput(1);
x=int64(x);
y=int64(y);
a=roi(y-5:y+5,x-5:x+5);
a=mean(mean(a));
ind=find(roi>a+300);
count=length(ind);
roi(ind)=2;
disp('CAC Score:')
if(count>110)
    disp('3')
else if(count>40)
        disp('2')
    else if(count>5)
            disp('1')
        else disp('0')
        end
    end
end
figure
imshow([roi])
colormap bone
caxis([0 1])
end