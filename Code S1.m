fileName = input('input video£º\n','s');
	obj = VideoReader(fileName);
    numFrames = obj.NumberOfFrames;% total number of frames
    
str='path1';
for k = 1 : 9			% read the image
     	frame = read(obj,k);
     	imwrite(frame,strcat('path1','000',num2str(k),'.jpg'));% save the frame
    end
    
    for k = 10 : 99			
     	frame = read(obj,k);
     	imwrite(frame,strcat('path1','00',num2str(k),'.jpg'));
    end
    
    for k = 100 : 999			
     	frame = read(obj,k);
     	imwrite(frame,strcat('path1','0',num2str(k),'.jpg'));
    end
    
  for k = 1000 : numFrames 			
     	frame = read(obj,k);
     	imwrite(frame,strcat('path1',num2str(k),'.jpg'));
  end  
    
  
N=[];n=1;I0=rgb2gray(imread([str,'0001.jpg']));[m,n]=size(I0);
for i=2:numFrames
    if (1<=i)&&(i<=9)
        a=rgb2gray(imread(strcat('path1','000',num2str(i),'.jpg')));
        b=rgb2gray(imread(strcat('path1','000',num2str(i-1),'.jpg'))); %read the image in order
        I=histeq(a-I0,256);%Gray level equalization
        I=I-b;
        I=double(I);
        Min=min(min(I));
        [m,n]=size(I);
        for j=1:m
            for k=1:n
                b(j,k)=I(j,k)-Min;
                b=double(b);
                b(j,k)=b(j,k)*255/(255-Min);%Gray level equalization
            end
        end
        b=uint8(b);
        b=medfilt2(b,[10,10]);%filter
        level=graythresh(b);
        b=im2bw(b,level);
        G=10;
        for j=1:m
             for k=1:n
             if bwlabel(b(j,k),4)<G
               b(j,k)=0;
             end
             end
        end
        imwrite(b,strcat('path2','000',num2str(i),'.jpg'));% save the frame
    elseif (10<=i)&&(i<=99)
        a=rgb2gray(imread(strcat('path1','00',num2str(i),'.jpg')));
        b=rgb2gray(imread(strcat('path1','00',num2str(i-1),'.jpg'))); 
        I=histeq(a-I0,256);
        I=I-b;
        I=double(I);
        Min=min(min(I));
        [m,n]=size(I);
        for j=1:m
            for k=1:n
                b(j,k)=I(j,k)-Min;
                b=double(b);
                b(j,k)=b(j,k)*255/(255-Min);
            end
        end
        b=uint8(b);
         b=medfilt2(b,[10,10]);
        level=graythresh(b);
        b=im2bw(b,level);
        G=10;
        for j=1:m
             for k=1:n
             if bwlabel(b(j,k),4)<G
               b(j,k)=0;
             end
             end
        end
        imwrite(b,strcat('path2','00',num2str(i),'.jpg'));
    elseif (100<=i)&&(i<=999)
        a=rgb2gray(imread(strcat('path1','0',num2str(i),'.jpg')));
        b=rgb2gray(imread(strcat('path1','0',num2str(i-1),'.jpg'))); 
        I=histeq(a-I0,256);
        I=I-b;
        I=double(I);
        Min=min(min(I));
        [m,n]=size(I);
        for j=1:m
            for k=1:n
                b(j,k)=I(j,k)-Min;
                b=double(b);
                b(j,k)=b(j,k)*255/(255-Min);
            end
        end
        b=uint8(b);
         b=medfilt2(b,[10,10]);
        level=graythresh(b);
        b=im2bw(b,level);
        G=10;
        for j=1:m
             for k=1:n
             if bwlabel(b(j,k),4)<G
               b(j,k)=0;
             end
             end
        end
        imwrite(b,strcat('path2','0',num2str(i),'.jpg'));
    else
        a=rgb2gray(imread(strcat('path1\',num2str(i),'.jpg')));
        b=rgb2gray(imread(strcat('path1',num2str(i-1),'.jpg'))); 
        I=histeq(a-I0,256);
        I=I-b;
        I=double(I);
        Min=min(min(I));
        [m,n]=size(I);
        for j=1:m
            for k=1:n
                b(j,k)=I(j,k)-Min;
                b=double(b);
                b(j,k)=b(j,k)*255/(255-Min);
            end
        end
        b=uint8(b);
        b=medfilt2(b,[10,10]);
        level=graythresh(b);
        b=im2bw(b,level);
        G=10;
        for j=1:m
             for k=1:n
             if bwlabel(b(j,k),4)<G
               b(j,k)=0;
             end
             end
        end
        imwrite(b,strcat('path2',num2str(i),'.jpg'));
    end
    
end

