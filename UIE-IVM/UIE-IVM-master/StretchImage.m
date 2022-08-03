function out = StretchImage(data)
s=0.005;bins=2000;
[ht,b]=imhist(data,bins);
[m,n]=size(data);
d=cumsum(ht)./double(m*n);
lmin=1;lmax=bins;
while lmin<bins
     if d(lmin)>s
         break;
     end    
     lmin=lmin+1;
end    
while lmax>1
     if d(lmax)<=1-s
         break;
     end    
     lmax=lmax-1;
end
out=(data-b(lmin))./(b(lmax)-b(lmin)); 
out(out>1)=1.0;
out(out<0)=0.0;
% M=max(max(data));
% Is=0.5+(data./2*M);
%  Is=data;
end