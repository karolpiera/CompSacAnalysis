%%%%%% Basic Analysis %%%%%%%%

%Getting output variables from data
filename = input('Please  select data file to load: ', 's');
data = load(filename);
tarloc = data(:,4);
ansLoc = data(:,7);
tTar = data(:,13);
sacOnset = data(:,23);


% Parameters for the hit count
Hit = 0;                                             % Starting value
nonHit = 0;                                          % Statting value
ePT = sacOnset - tTar;                                   % Effective Processing Time
compvec = double(ansLoc == tarloc);                 % Hits and nonhits (0 - nonHit 1 - Hit) / comparison vector
CompMat = [ compvec ePT ];                            % Hits and ePT



% Hits plotted with effective processing time
scatter(ePT,compvec);
ylabel ('Hits')
xlabel ('Effective Processing Time')

% Calculating the ratio of hits and mean in bins
% Parameters

timev = min(CompMat(:,2)):max(CompMat(:,2));                    % time span of ePT 
binw = 50;                                                      % width of time bin
count = 1;                                                      % loop counter

%Calculating propotion of hits vs. non hits for moving time window - moving
%mean

for el = timev
    win = el:(el + binw);
    vecA = find(CompMat(:,2) <= max(win) & CompMat(:,2) >= min(win));
    pCorAns = sum(CompMat(vecA,1))/length(vecA);
    vecB(count) = pCorAns;
    count = count+1;
end

% Plotting results from the loop 
scatter(timev,vecB)
ylabel ('Proportion of correct answers')
xlabel ('Effective Processing Time')
