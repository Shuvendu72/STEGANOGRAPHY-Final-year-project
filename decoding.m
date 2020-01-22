%%%%% Decoding.m%%%%%%%%%%%%%%%%%
im=imread('Stego.bmp');
[cA11,cH11,cV11,cD11] = dwt2(CODED1,wname);
data=[];
data1=[];
[x y]=size(cH11);
data_norm=[];
n=ceil(abs(cH11(1,1)*10))-1;
M=abs(cH11(1,2)*10);
for(i=1:1:ceil(n/2))
data_norm(i)=cV11(i,y);
end
for(i=ceil(n/2)+1:1:n)
data_norm(i)=cD11(i,y);
end
% data=ceil(data_norm*M)-1;
for i=1:n
    data(i)=data_norm(i)*M;
end
data1=round(data);
msg1=char(data1);
fileID = fopen('decode.txt','w');
fprintf(fileID,'%6s\n',msg1);
% msg1='';
% for(i=1:length(data))
% msg1=strcat(msg1,abs(data(i)));
% end
msg1
%%End of Decoding.m