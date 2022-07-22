(* ::Package:: *)

BeginPackage["DeltaConstant`"]

DeltaCoeff::usage = "DeltaCoeff[time, \[Delta]F] returns piecewise constand \[Delta] "; 

Begin["`Private`"]

DeltaCoeff[time_, \[Delta]F_] :=
    Module[
        {n},
        (* Write \[Delta] as piecewise constant*)
        n = Length[time];
        For[i = 1, i <= n - 1, i++,
            \[Delta][i] = a[i];
        ];
        (*Delta post-hinginess*)
        \[Delta][n] = \[Delta]F;
        \[Delta]
    ];

End[]
EndPackage[]





BeginPackage["SimpleArithmetic`"]

AddTwo::usage = "AddTwo[a, b] returns a+b";
AddThree::usage = "AddThree[a, b, c] returns a+b+c";
TimesTwo::usage = "TimesTwo[a, b] returns a*b";
TimesThree::usage = "TimesThree[a, b, c] returns a*b*c";

Begin["`Private`"]

plus[args___] := Plus[args];
times[args___] := Times[args]

AddTwo[a_, b_] := plus[a, b];
AddThree[a_, b_, c_] := plus[a, b, c];
TimesTwo[a_, b_] := times[a, b];
TimesThree[a_, b_, c_] := times[a, b, c];

End[]
EndPackage[]


BeginPackage["ProbaAI`"]

pAI::usage = "\[Delta]C[time, \[Delta]F] returns piecewise constand \[Delta] "; 

Begin["`Private`"]

pAI[time_, \[Delta]F_] :=
    Module[
        {n},
        n = Length[time];
        p = \[Delta]F*(time[[n]]-time[[1]]);
    p]

End[]

EndPackage[]





BeginPackage["HazardFun`"]

HazardCoeff::usage = "HazardCoeff[time, \[Delta]F] returns coeff of \[Delta] "; 

Begin["`Private`"]

HazardCoeff[time_, \[Delta]F_] :=
    Module[
        {n},
        (* Write \[Delta] as piecewise constant*)
        n = Length[time];
        For[i = 1, i <= n - 1, i++,
            \[Delta][i] = a[i];
        ];
        (*Delta post-hinginess*)
        \[Delta][n] = \[Delta]F;
        \[Delta]
    ];

End[]

EndPackage[]




