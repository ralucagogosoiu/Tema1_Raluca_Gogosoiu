% definesc cele 3 perioade de esantionare Ts=2ms, Ts=20ms, Ts=200ms

T_sample_2ms = 0.002;
T_sample_20ms = 0.02;
T_sample_200ms = 0.2;
%% generarea unui semnal dreptungiular 
T = 2; %perioada semnalului

t2 = 0:T_sample_2ms:3*T-T_sample_2ms;%perioada semnalului esantionat cu Ts= 2 ms(parcurg 3 perioade)
x2 = square(t2(t2<T)*pi,25); %generarea unui semnal dreptunghiular Ts= 2 ms
x2 = x2 * 0.75 - 0.25; % setarea amplitudinii 
x2 =[x2,x2,x2]; % repet semnalul de 3 ori

figure();
% afisarea semnalului
plot(t2,x2);
title('Semnal dreptunghiular cu Tsample=2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t20= 0:T_sample_20ms:3*T-T_sample_20ms; % perioada semnalului esantionat cu Ts= 20ms
x20 = square(t20(t20<T)*pi,25); % generarea semnalului dreptunghiular ts= 20 ms
x20 = x20 * 0.75 - 0.25; %setarea amplitudinii
x20 =[x20,x20,x20]; % repet semnalul de 3 ori

figure();
% afisarea semnalului
plot(t20,x20);
title('Semnal dreptunghiular cu Tsample=20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200 = 0:T_sample_200ms:3*T-T_sample_200ms; % perioada semnalului esantionat cu Ts = 200ms
x200 = square(t200(t200<T)*pi,25); % generarea semnalului dreptaunghiular cu Ts= 200ms
x200 = x200 * 0.75 - 0.25; % setarea amplitudinii 
x200 =[x200,x200,x200]; %repet semnalul de 3 ori

figure();
%afisarea semnalului
plot(t200,x200);
title('Semnal dreptunghiular cu Tsample=200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

%% generarea unui semnal triunghiular

%explicatiile sunt la fel ca mai sus, numai ca am generat un semnal
%triunghiular

T = 5;

t2 = 0:T_sample_2ms:3*T-T_sample_2ms;
x2 = sawtooth(t2(t2<=T-T_sample_2ms)*(2*pi/T),3/5); % panta+ = 1V/s ; panta- = -1.5 V/s
x2 = x2 * 1.5 - 0.5;
x2 =[x2,x2,x2];

figure();
plot(t2,x2);
title('Semnal triunghiular cu Tsample=2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t20= 0:T_sample_20ms:3*T-T_sample_20ms;
x20 = sawtooth(t20(t20<=T-T_sample_20ms)*(2*pi/T),3/5); % panta+ = 1V/s ; panta- = -1.5 V/s
x20 = x20 * 1.5 - 0.5;
x20 =[x20,x20,x20];


figure()
plot(t20,x20);
title('Semnal triunghiular cu Tsample=20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200 = 0:T_sample_200ms:3*T-T_sample_200ms;
x200 = sawtooth(t200(t200<=T-T_sample_20ms)*(2*pi/T),3/5);
x200 = x200 * 1.5 - 0.5;
x200 =[x200,x200,x200];

figure()
plot(t200,x200);
title('Semnal triunghiular Ts=200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

%% semnal multinivel aleator a) {-1,1}


T = 5;
t2 = 0:T_sample_2ms:T-T_sample_2ms;
x=rand(1,T/0.25);% generarea unui vector cu numere random de dimensiune 20

% punerea unor conitii pentru a imparti numerele in categorii.Impartim
% intervalul (0,1) in 4 intervale egale si se verifica in care interval se
% afla fiecare din numerele vectorului generat random apoi se asocieaza
% pentru fiecare interval un numar {-3,-1,1,3}. De exemplu pentru
% x< 0.25 va fi asociata valoarea -3 , etc
for i=1:length(x)
	if x(i)>0.5
		x(i)=1;
    end
	if (0.5>x(i))
		x(i)=-1;
	end
end
% crearea unui vector care sa genereze semnalele pentru fiecare nivel in
% parte apoi sa le concateneze
x2=ones(1,0.25/T_sample_2ms) % crearea unui vector cu nr. de esantioane necesar
x2=x2*x(1); % inmultirea cu valoarea nivelului  
for i=2:length(x)
	x2 = [x2,x(i)* ones(1,0.25/T_sample_2ms)];
end

figure();
plot(t2,x2);
title('Semnal -1,1 cu Tsample= 2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t20= 0:T_sample_20ms:T-T_sample_2ms;
x20 = x2(1:10:length(x2));

figure();
plot(t20,x20);
title('Semnal -1,1 cu Tsample= 20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200= 0:T_sample_200ms:T-T_sample_2ms;
x200 = x2(1:100:length(x2));

figure();
plot(t200,x200);
title('Semnal -1,1 cu Tsample= 200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

%% semnal multinivel aleator b) {-3,-1,1,3}


T = 5;
t2 = 0:T_sample_2ms:T-T_sample_2ms;

x=rand(1,T/0.25);% generarea unui vector cu numere random de dimensiune 20

% punerea unor conitii pentru a imparti numerele in categorii.Impartim
% intervalul (0,1) in 4 intervale egale si se verifica in care interval se
% afla fiecare din numerele vectorului generat random apoi se asocieaza
% pentru fiecare interval un numar {-3,-1,1,3}. De exemplu pentru
% x< 0.25 va fi asociata valoarea -3 , etc
for i=1:length(x)
	if x(i)>0.75
		x(i)=3;
	end
	if x(i)<0.25
		x(i)=-3;
	end
	if (0.5<x(i) && x(i)<0.75)
		x(i)=1;
	end
	if (0.5>x(i) && x(i)>0.25)
		x(i)=-1;
	end
end
% crearea unui vector care sa genereze semnalele pentru fiecare nivel in
% parte apoi sa le concateneze
x2=ones(1,0.25/T_sample_2ms)
x2=x2*x(1);
for i=2:length(x)
	x2 = [x2,x(i)* ones(1,0.25/T_sample_2ms)];
end
figure();
plot(t2,x2);
title('Semnal -3,-1,1,3 cu Tsample= 2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t20= 0:T_sample_20ms:T-T_sample_2ms;
x20 = x2(1:10:length(x2));

figure();
plot(t20,x20);
title('Semnal -3,-1,1,3 cu Tsample= 20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200= 0:T_sample_200ms:T-T_sample_2ms;
x200 = x2(1:100:length(x2));

figure();
plot(t200,x200);
title('Semnal -3,-1,1,3 cu cu Tsample = 200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

%% semnal multinivel aleator c) {-5,-3,-1,1,3,5}


T = 5;
t2 = 0:T_sample_2ms:T-T_sample_2ms;

x=rand(1,T/0.25);% generarea unui vector cu numere random de dimensiune 20

% punerea unor conitii pentru a imparti numerele in categorii.Impartim
% intervalul (0,1) in 6 intervale egale si se verifica in care interval se
% afla fiecare din numerele vectorului generat random apoi se asocieaza
% pentru fiecare interval un numar {-5,-3,-1,1,3,5}. De exemplu pentru
% x< 1/6 va fi asociata valoarea -5 , etc
for i=1:length(x)
	if x(i)>5/6
		x(i)=5;
	end
	if x(i)<1/6
		x(i)=-5;
	end
	if (4/6<x(i) && x(i)<5/6)
		x(i)=3;
	end
	if (2/6>x(i) && x(i)>1/6)
		x(i)=-3;
	end
	if (3/6<x(i) && x(i)<4/6)
		x(i)=1;
	end
	if (3/6>x(i) && x(i)>2/6)
		x(i)=-1;
	end
	
end

% crearea unui vector care sa genereze semnalele pentru fiecare nivel in
% parte apoi sa le concateneze
x2=ones(1,0.25/T_sample_2ms)
x2=x2*x(1);
for i=2:length(x)
	x2 = [x2,x(i)* ones(1,0.25/T_sample_2ms)];
end
figure();
plot(t2,x2);
title('Semnal -5,-3,-1,1,3,5 cu Tsample=2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t20= 0:T_sample_20ms:T-T_sample_2ms;
x20 = x2(1:10:length(x2));

figure();
plot(t20,x20);
title('Semnal -5,-3,-1,1,3,5 cu Tsample= 20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200= 0:T_sample_200ms:T-T_sample_2ms;
x200 = x2(1:100:length(x2));

figure();
plot(t200,x200);
title('Semnal -5,-3,-1,1,3,5 cu Tsample= 200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

%% generarea unui semnal multinivel aleator d) {-7,-5,-3,-1,1,3,5,7}


T = 5;
t2 = 0:T_sample_2ms:T-T_sample_2ms;

x=rand(1,T/0.25);% generarea unui vector cu numere random de dimensiune 20

% punerea unor conitii pentru a imparti numerele in categorii.Impartim
% intervalul (0,1) in 8 intervale egale si se verifica in care interval se
% afla fiecare din numerele vectorului generat random apoi se asocieaza
% pentru fiecare interval un numar {-7,-5,-3,-1,1,3,5,7}. De exemplu pentru
% x< 1/8 va fi asociata valoarea -7 , etc
for i=1:length(x)
	if x(i)>7/8
		x(i)=7;
	end
	if x(i)<1/8
		x(i)=-7;
	end
	if (6/8<x(i) && x(i)<7/8)
		x(i)=5;
	end
	if (2/8>x(i) && x(i)>1/8)
		x(i)=-5;
	end
	if (5/8<x(i) && x(i)<6/8)
		x(i)=3;
	end
	if (3/8>x(i) && x(i)>2/8)
		x(i)=-3;
	end
	if (4/8<x(i) && x(i)<5/8)
		x(i)=-3;
	end
	if (4/8>x(i) && x(i)>3/8)
		x(i)=-1;
	end
	
end

% crearea unui vector care sa genereze semnalele pentru fiecare nivel in
% parte apoi sa le concateneze
x2=ones(1,0.25/T_sample_2ms)
x2=x2*x(1);
for i=2:length(x)
	x2 = [x2,x(i)* ones(1,0.25/T_sample_2ms)];
end
figure();
plot(t2,x2);
title('Semnal -7,-5,-3,-1,1,3,5,7 cu Tsample=2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t20= 0:T_sample_20ms:T-T_sample_2ms;
x20 = x2(1:10:length(x2));

figure();
plot(t20,x20);
title('Semnal -7,-5,-3,-1,1,3,5,7 cu Tsample=20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200= 0:T_sample_200ms:T-T_sample_2ms;
x200 = x2(1:100:length(x2));

figure();
plot(t200,x200);
title('Semnal -7,-5,-3,-1,1,3,5,7 cu Tsample=200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')



%% generarea unui semnal sinusoidal redresat mono-alternanta

T = 3; % perioada semnalului

t2 = 0:T_sample_2ms:3*T-T_sample_2ms;
x2 = sin(t2(t2<T)*2*pi/T); %generarea unui sinus cu Ts = 2ms (3 perioade)
x2 = x2 * 0.8; % setarea amplitudinii
x2(x2<0)=0; % partea negativa a sinsului o fac 0 => mono-alternanta
x2 =[x2,x2,x2]; % repet de 3 ori semnalul

figure();
%afisez semnalul
plot(t2,x2);
title('Semnal sinusoidal redresat mono-alternanta cu Tsample=2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

% la fel si pentru Ts = 20ms, respectiv Ts=200ms

t20= 0:T_sample_20ms:3*T-T_sample_20ms;
x20 = sin(t20(t20<T)*2*pi/T);
x20 = x20 * 0.8;
x20(x20<0)=0;
x20 =[x20,x20,x20];

figure();
plot(t20,x20);
title('Semnal sinusoidal redresat mono-alternanta cu Tsample=20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200= 0:T_sample_200ms:3*T-T_sample_200ms;
x200 = sin(t200(t200<T)*2*pi/T);
x200 = x200 * 0.8;
x200(x200<0)=0;
x200 =[x200,x200,x200];

figure()
plot(t200,x200);
title('Semnal sinusoidal redresat mono-alternanta cu Tsample=200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')


%% generearea unui semnal sinusoidal redresat dubla-alternanta

T = 4; %perioada semnalului

t2 = 0:T_sample_2ms:3*T-T_sample_2ms;
x2 = sin(t2(t2<T)*2*pi/T);%generez un sinus cu Ts= 2ms 
x2 = x2 * 1.5; % setez amplitudinea
x2(x2<0)=x2(x2<0)*-1; % inmultesc cu (-1) partea negativa a sinusului => dubla alternanta
x2 =[x2,x2,x2]; % repet semnalul de 3 ori

figure();
%afisez semnalul
plot(t2,x2);
title('Semnal sinusoidal redresat mono-alternanta cu Tsample=2ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

%la fel pentru Ts =20ms respectiv Ts=200ms

t20 = 0:T_sample_20ms:3*T-T_sample_20ms;
x20 = sin(t20(t20<T)*2*pi/T);
x20 = x20 * 1.5;
x20(x20<0)=x20(x20<0)*-1;
x20 =[x20,x20,x20];

figure();
plot(t20,x20);
title('Semnal sinusoidal redresat mono-alternanta cu Tsample=20ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')

t200 = 0:T_sample_200ms:3*T-T_sample_200ms;
x200 = sin(t200(t200<T)*2*pi/T);
x200 = x200 * 1.5;
x200(x200<0)=x200(x200<0)*-1;
x200 =[x200,x200,x200];

figure()
plot(t200,x200);
title('Semnal sinusoidal redresat dubla-alternanta cu Tsample=200ms');
xlabel('Timp [s]');
ylabel('Amplitudine [V]')






