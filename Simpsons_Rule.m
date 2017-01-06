%Grupo 2
function [S] = Simpson(a,b,N,f) 
%Notas de auxilio: função f deve ser passada como @(x)...
%PARAMETROS
%a-Extremo inferior do integral
%b-Extremo superior do integral
%N-Número de subintervalos
%f-função a utilizar

format long;

%Verificação dos parametros
if(a==b)
    fprintf('Não é possível a ser igual a b');
    exit;
end

if( rem(N,2) ~= 0 || N<0) 
    fprintf('Valor de N inválido');
    exit;
end

h=(a+b)/N;

%Inicialização dos termos de soma
f_0 = f(a);
f_j=0;
f_j2=0;
f_n = f(b);

%Calculo dos restantes termos necessários para a aplicação do método
for j=1:(N/2)
    i=2*j-1;
    f_j = f_j + feval(f,a+i*h);
end

for j=1:((N/2)-1)
    i=2*j;
    f_j2 = f_j2 + feval(f,a+i*h);
end

%Regra de Simpson
S=(h/3)*(f_0 + 4*f_j + 2*f_j2 + f_n);
fprintf('>>F=S(%d) = %.8f\n\n',N,S);



