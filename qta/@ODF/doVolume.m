function [v,S3G] = doVolume(odf,center,radius,S3G,varargin)

% get resolution
res = get_option(varargin,'RESOLUTION',min(1.25*degree,radius/30),'double');

% discretisation
if nargin < 4 || isempty(S3G)
  S3G = equispacedSO3Grid(odf(1).CS,odf(1).SS,...
    'maxAngle',radius,'center',center,'resolution',res,varargin{:});
end

% estimate volume portion of odf space
reference = 9897129 * 96 / length(odf(1).CS) / length(odf(1).SS);
f = min(1,numel(S3G) * (res / 0.25 / degree)^3 / reference);
  
% eval odf
if f == 0
  v = 0;
else
  v = mean(eval(odf,S3G)) * f;  %#ok<EVLC>
  v = min(v,sum(odf.weight));
end
