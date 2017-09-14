%%%% Basic Statistics %%%%%

%Getting output variables from data
filename = input('Please  select data file to load: ', 's');
TarPos = GetTarPos(filename,1,240);
LandPos = GetLandPos(filename,1, 240);
tSac = GettSac(filename,1,240);
tTar = gettTar(filename,1,240);

% Parameters for the hit count
Hit = 0;                                             % Starting value
nonHit = 0;                                          % Statting value
ePT = tSac - tTar;                                   % Effective Processing Time
compvec = double(LandPos == TarPos);                 % Hits and nonhits (0 - nonHit 1 - Hit) / comparison vector

% Counts Hits

for i = 1:length(LandPos)
if LandPos(i) == TarPos(i)
    Hit = Hit + 1;
else
    nonHit = nonHit + 1;
end
end

CompMat = [ compvec ePT ];     % 

scatter(ePT,compvec);
ylabel ('Hits')
xlabel ('Effective Processing Time')

% Calculating the ratio of hits and mean in bins
% Parameters
timev = min(CompMat(:,2)):max(CompMat(:,2));                    % time windows 
binw = 50;                                                      % width of time bin
count = 1;                                                      % loop counter

for el = timev
    win = el:(el + binw);
    vecA = find(CompMat(:,2) <= max(win) & CompMat(:,2) >= min(win));
    pCorAns = sum(CompMat(vecA,1))/length(vecA);
    vecB(count) = pCorAns;
    count = count+1;
end


scatter(timev,vecB)
ylabel ('Proportion of correct answers')
xlabel ('Effective Processing Time')










