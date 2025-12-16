FLCs = load('FLCsInit.mat');

Waypoints.time = [0];
% Input Waypoint values here. One waypoint per row as [x y z] vector
Waypoints.signals.values = [5 0 -15; 5 5 -20; 10 10 -20];
N = size(Waypoints.signals.values, 1);
Waypoints.signals.dimensions = [N, 3];

t = sim('FullModel.slx');

x = Position.signals(1).values;
y = Position.signals(2).values;
h = Position.signals(3).values;

phi = 180/pi*Attitude.signals(1).values;
theta = 180/pi*Attitude.signals(2).values;
psi = 180/pi*Attitude.signals(3).values;

figure(1)
F1 = tiledlayout(3,1);
ax1 = nexttile;
ax2 = nexttile;
ax3 = nexttile;

plot(ax1, t, x, 'b')
ylabel('x, m')

plot(ax2, t, y, 'b')
ylabel('y, m')

plot(ax3, t, h, 'b')
ylabel('h, m')
xlabel('Time, s')

hold([ax1 ax2 ax3],'on')

for i=1:N

    xwp = Waypoints.signals.values(i,1)*ones(size(t));
    ywp = Waypoints.signals.values(i,2)*ones(size(t));
    hwp = -Waypoints.signals.values(i,3)*ones(size(t));
    
    plot(ax1, t, xwp, 'k')
    plot(ax2, t, ywp, 'k')
    plot(ax3, t, hwp, 'k')

end

grid([ax1 ax2 ax3],'on')
legend('Actual','Desired')
hold([ax1 ax2 ax3],'off')

figure(2)
subplot(3,1,1)
plot(t, phi,'b')
ylabel('\phi, deg')
grid on

subplot(3,1,2)
plot(t, theta,'b')
ylabel('\theta, deg')
grid on

subplot(3,1,3)
plot(t, psi,'b')
ylabel('\psi, deg')
xlabel('Time, s')
grid on

figure(3)
plot3(x, y, h, 'b')
hold on
for k=1:N

    xcwp = Waypoints.signals.values(k,1);
    ycwp = Waypoints.signals.values(k,2);
    hcwp = -Waypoints.signals.values(k,3);
    
    plot3(xcwp, ycwp, hcwp,'*r')

end
xlabel('x, m')
ylabel('y, m')
zlabel('h, m')
grid on
legend('Trajectory','Waypoints')

hold off
