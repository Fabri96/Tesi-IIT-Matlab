function [m1_pre, m1_test, m1_post,m2_pre,m2_test,m2_post] = one_one_accept_split(mouse1,mouse2,d)
k = find(mouse1(1,:) == "rejected") ;

mouse1(:,k) = [];

k2=find(mouse1(1,:) == " rejected");
mouse1(:,k2) = [];

k3 = find(mouse2(1,:) == "rejected") ;

mouse2(:,k3) = [];

k4=find(mouse2(1,:) == " rejected");
mouse2(:,k4) = [];


if(d==1)


m1_pre = mouse1(2:12011,1:9);
m1_pre=double(m1_pre);

m1_test=mouse1(12012:30027,1:9);
m1_test=double(m1_test);

m1_post=mouse1(30028:end,1:9);
m1_post=double(m1_post);

m2_pre = mouse2(2:12011,1:15);
m2_pre=double(m2_pre);

m2_test=mouse2(12012:30027,1:15);
m2_test=double(m2_test);

m2_post=mouse2(30028:end,1:15);
m2_post=double(m2_post);
m2_post(1,:)=[];

end



if(d==2)

m1_pre = mouse1(2:12012,1:31);
m1_pre=double(m1_pre);
m1_pre(end,:)=[];
m1_test=mouse1(12013:30027,1:31);
m1_test=double(m1_test);

m1_post=mouse1(30028:end,1:31);
m1_post=double(m1_post);

m2_pre = mouse2(2:12011,1:24);
m2_pre=double(m2_pre);

m2_test=mouse2(12012:30026,1:24);
m2_test=double(m2_test);

m2_post=mouse2(30027:end,1:24);
m2_post=double(m2_post);


end

