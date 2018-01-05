function sVF = rotate(sVF, rot)
% rotate a function by a rotation
%
% Syntax
%  sVF = sVF.rotate(rot)
%
% Input
%  sVF - @S2FunHarmonic
%  rot - @rotation
%

sVF.sF = rotate(sVF.sF, rot);

end
