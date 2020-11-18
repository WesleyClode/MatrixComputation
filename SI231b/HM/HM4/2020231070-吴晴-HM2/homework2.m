close;
clear;
%% the number of bases: k
k = 9;

%% f(x): f
x1 = 1;
x2 = 2;
f(1) = x1;
f(2) = x2;
f_interval_point(1) = 0;
f_interval_point(2) = 0.5;
f_interval_point(3) = 1;

%% Basese: phi
syms x;
delta_x = 1.0 / (k + 1);
for ii = 0:k-1
    phi(ii+1, 1) = (x - delta_x*ii) / delta_x;
    phi(ii+1, 2) = -(x - delta_x*(ii+2)) / delta_x;

    phi_interval_point(ii+1, 1) = delta_x*ii;
    phi_interval_point(ii+1, 2) = delta_x*(ii+1);
    phi_interval_point(ii+1, 3) = delta_x*(ii+2);
end
phi
phi_interval_point

%% The differences of phi: phi_diff
for ii = 1:length(phi)
    phi_diff(ii, 1) = diff(phi(ii, 1));      
    phi_diff(ii, 2) = diff(phi(ii, 2));  
end
phi_diff

%% Stiffness Matrix: A
for ii = 1:k
    for jj = 1:k
        if ii == jj
            c1 = int(phi_diff(ii, 1)*phi_diff(jj, 1), phi_interval_point(ii, 1), phi_interval_point(ii, 2));
            c2 = int(phi_diff(ii, 2)*phi_diff(jj, 2), phi_interval_point(ii, 2), phi_interval_point(ii, 3));
            A(ii, jj) = double(c1) + double(c2);
        elseif abs(ii-jj) == 1 && ii > jj
            c = int(phi_diff(ii, 1)*phi_diff(jj, 2), phi_interval_point(jj, 2), phi_interval_point(ii, 2));
            A(ii, jj) = double(c);
        elseif abs(ii-jj) == 1 && jj > ii
            c = int(phi_diff(jj, 1)*phi_diff(ii, 2), phi_interval_point(ii, 2), phi_interval_point(jj ,2));
            A(ii, jj) = double(c);
        end
    end
end
A

%% F
for ii = 1:k
    % phi(i) fully is at the left side of the point(x=0.5)
    if phi_interval_point(ii, 3) <= f_interval_point(2) 
        c1 = int(phi(ii, 1)*f(1), phi_interval_point(ii, 1), phi_interval_point(ii, 2));
        c2 = int(phi(ii, 2)*f(1), phi_interval_point(ii, 2), phi_interval_point(ii, 3));
    % phi(i) fully is at the right side of the point(x=0.5)
    elseif phi_interval_point(ii, 1) >= f_interval_point(2)
        c1 = int(phi(ii, 1)*f(2), phi_interval_point(ii, 1), phi_interval_point(ii, 2));
        c2 = int(phi(ii, 2)*f(2), phi_interval_point(ii, 2), phi_interval_point(ii, 3));
    % phi(i) is at the center of aixs
    elseif phi_interval_point(ii, 2) == f_interval_point(2)
        c1 = int(phi(ii, 1)*f(1), phi_interval_point(ii, 1), phi_interval_point(ii, 2));
        c2 = int(phi(ii, 2)*f(2), phi_interval_point(ii, 2), phi_interval_point(ii, 3));
    end
    F(ii) = double(c1) + double(c2);
end
F

%% alpha
alpha = inv(A)*F'

%% U
xx = 0:0.01:1;
Nxx = length(xx);

for ii = 1:k
    phi(ii, 3) = (phi(ii, 1) * (x>phi_interval_point(ii, 1)&x<=phi_interval_point(ii, 2))...
        + phi(ii, 2) * (x>phi_interval_point(ii, 2)&x<phi_interval_point(ii, 3)));
end
phi(:, 3)

for i = 1:Nxx
    x = xx(i);
    u(i) = eval(alpha' * phi(:, 3));
end

%% Plot
% plot u_k
figure(1);
plot(xx, u, '-','LineWidth',2);
xlabel('$x$', 'interpreter', 'latex', 'FontSize', 22);
ylabel('$U_k$', 'interpreter', 'latex', 'FontSize', 22);

% plot phi
for i = 1:Nxx
    x = xx(i);
    phi_plot(:, i) = eval(phi(:, 3));
end
figure(2);
for i = 1:k
    plot(xx, phi_plot(i, :));
    xlabel('$x$', 'interpreter', 'latex', 'FontSize', 22);
    ylabel('$\phi_i(x)$', 'interpreter', 'latex', 'FontSize', 22);
    hold on;
end 

% plot f
syms x;
f_x = 1*(x>0&x<0.5) + 2*(x>=0.5&x<1);
for i = 1:Nxx
    x = xx(i);
    f_plot(i) = eval(f_x);
end
figure(3);
plot(xx, f_plot, '-','LineWidth',2);
xlabel('$x$', 'interpreter', 'latex', 'FontSize', 22);
ylabel('$f(x)$', 'interpreter', 'latex', 'FontSize', 22);