%Classification using perceptron
clc
clear
%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
%4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
%5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
%6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
%7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
%8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
%9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%Desired output vector
T=[1;1;1;-1;-1];

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);

e=zeros(5,1);
v=zeros(5,1);
% calculate wieghted sum with randomly generated parameters
for i = 1:5
    v(i)=x1(i)*w1+x2(i)*w2+b;           %x2=-b/w2-x1*w1/w2
    % calculate current output of the perceptron 
        if v(i) > 0
            y = 1;
        else
            y = -1;
        end
    % calculate the error
    e(i) = T(i) - y;
end

% calculate the total error for these 5 inputs 
 e1 = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
 e2 = e(1) + e(2) + e(3) + e(4) + e(5);
n=0.1;
% write training algorithm
j=0;
while e1 ~= 0 % executes while the total error is not 0
    j=j+1;
	% here should be your code of parameter update
%   calculate output for current example
% 
%   calculate error for current example
% 
%   update parameters using current inputs ant current error
 	w1 = w1 + n*e(1)*x1(1)+ n*e(2)*x1(2)+ n*e(3)*x1(3)+n*e(4)*x1(4)+n*e(5)*x1(5);
    w2 = w2 + n*e(1)*x2(1)+ n*e(2)*x2(2)+ n*e(3)*x2(3)+n*e(4)*x2(4)+n*e(5)*x2(5);
    b = b + n*e2;
% 
%   Test how good are updated parameters (weights) on all examples used for training
%   calculate outputs and errors for all 5 examples using current values of the parameter set {w1, w2, b}
i=0;
    for i = 1:5
        v(i)=x1(i)*w1+x2(i)*w2+b;
        % calculate current output of the perceptron 
            if v(i) > 0
                y = 1;
            else
                y = -1;
            end
        % calculate the error
        e(i) = T(i) - y;
    end

% calculate the total error for these 5 inputs 
 e1 = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
 e2 = e(1) + e(2) + e(3) + e(4) + e(5);
	% calculate the total error for these 5 inputs 
	%e = abs(e1) + abs(e2) + abs(e3) + abs(e4) + abs(e5);
end
figure(1)
x=0:0.01:1;
f=-b/w2-x*w1/w2;
plot(x,f,'g')
hold on
plot(hsv_value_A1,metric_A1,'b*')
plot(hsv_value_A2,metric_A2,'b*')
plot(hsv_value_A3,metric_A3,'b*')
plot(hsv_value_A4,metric_A4,'b*')
plot(hsv_value_A5,metric_A5,'b*')
plot(hsv_value_A6,metric_A6,'b*')
plot(hsv_value_A7,metric_A7,'b*')
plot(hsv_value_A8,metric_A8,'b*')
plot(hsv_value_A9,metric_A9,'b*')
plot(hsv_value_P1,metric_P1,'ro')
plot(hsv_value_P2,metric_P2,'ro')
plot(hsv_value_P3,metric_P3,'ro')
plot(hsv_value_P4,metric_P4,'ro')
hold off

v=hsv_value_A4*w1+metric_A4*w2+b;
figure(2)
subplot(4,2,1)
image(A4);
if v>0
    title('obuolys');
else
    title('kriause');
end

v=hsv_value_A5*w1+metric_A5*w2+b;
figure(2)
subplot(4,2,2)
image(A5);
if v>0
    title('obuolys');
else
    title('kriause');
end

v=hsv_value_A6*w1+metric_A6*w2+b;
figure(2)
subplot(4,2,3)
image(A6);
if v>0
    title('obuolys');
else
    title('kriause');
end
    
v=hsv_value_A7*w1+metric_A7*w2+b;
figure(2)
subplot(4,2,4)
image(A7);
if v>0
    title('obuolys');
else
    title('kriause');
end

v=hsv_value_A8*w1+metric_A8*w2+b;
figure(2)
subplot(4,2,5)
image(A8);
if v>0
    title('obuolys');
else
    title('kriause');
end

v=hsv_value_A9*w1+metric_A9*w2+b;
figure(2)
subplot(4,2,6)
image(A9);
if v>0
    title('obuolys');
else
    title('kriause');
end

v=hsv_value_P3*w1+metric_P3*w2+b;
figure(2)
subplot(4,2,7)
image(P3);
if v>0
    title('obuolys');
else
    title('kriause');
end

v=hsv_value_P4*w1+metric_P4*w2+b;
figure(2)
subplot(4,2,8)
image(P4);
if v>0
    title('obuolys');
else
    title('kriause');
end