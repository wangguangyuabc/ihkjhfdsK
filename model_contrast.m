clc;clear
%% 导入数据
load BP.mat
BP = T_sim2(1:25);
load CNN.mat
CNN = T_sim2(1:25)';
load GA_BP.mat
GA_BP = T_sim2(1:25);
load PSO_BP.mat
PSO_BP = T_sim2(1:25);
load PSO_SVM.mat
PSO_SVM = T_sim2(1:25)';
load The_real_data.mat
The_real_data = T_sim2(1:25)';
%% 绘制对比图
figure;
hold on;
plot(BP, 'LineWidth', 2, 'DisplayName', 'BP');
plot(CNN, 'LineWidth', 2, 'DisplayName', 'CNN');
plot(GA_BP, 'LineWidth', 2, 'DisplayName', 'GA\_BP');
plot(PSO_BP, 'LineWidth', 2, 'DisplayName', 'PSO\_BP');
plot(PSO_SVM, 'LineWidth', 2, 'DisplayName', 'PSO\_SVM');
plot(The_real_data, 'LineWidth', 2, 'DisplayName', 'Real Data');

%% 添加图例和标签
legend('show');
xlabel('样本序号');
ylabel('预测值');
title('不同模型的预测结果对比');
grid on;
hold off;


