(* ::Package:: *)

BeginPackage["ProbaAI`"]

\[Delta]Hazard::usage = "\[Delta]Hazard[\[Tau]_,time_, pAI_, \[Delta]F_] returns hazard function";
probaAI::usage = "probaNoAI[t,time, pAI, \[Delta]F] returns proba of AI before t"; 


Begin["`Private`"]

\[Delta]Hazard[\[Tau]_,time_, pAI_, \[Delta]F_] :=
    Module[{n, \[Delta]Int, sol, \[Delta]S, i, a, \[Delta]Graph},
        n = Length[time];
        (* Find \[Delta] Coefficients *)
        For[i = 1, i <= n - 1, i++,
            \[Delta]Int[i] = Integrate[a[i], {\[Tau], time[[i]], time[[i + 1]]}];
                
            sol[i] = NSolve[\[Delta]Int[i] == -Log[1 - (pAI[[i + 1]] - pAI[[
                i]]) / (1 - pAI[[i]])], a[i]];
            \[Delta]S[i] = (a[i] /. sol[i]);
            \[Delta]S[i] = \[Delta]S[i][[1]];
            
        ];
        (* Make Piecewise Graph *)
        \[Delta]Graph = ConstantArray[\[Tau], {n - 1, 2}];
        For[i = 1, i <= n - 1, i++,
            \[Delta]Graph[[i]][[1]] = \[Delta]S[i];
            \[Delta]Graph[[i]][[2]] = time[[i]] <= \[Tau] <= time[[i + 1]]
        ];
        (* Return piecewise \[Delta] *)
        \[Delta]P = Piecewise[\[Delta]Graph, \[Delta]F];
        \[Delta]P
    ]; 

probaAI[t_,time_, pAI_, \[Delta]F_] :=
    Module[{\[Delta]Int, \[Delta]P,\[Tau]},
        \[Delta]P = \[Delta]Hazard[\[Tau], time, pAI, \[Delta]F];
        \[Delta]Int = Integrate[\[Delta]P, {\[Tau], 0, t}, Assumptions -> 0 <=
             t] // FullSimplify;
        p = Exp[-\[Delta]Int];
        p = 1-p;
        p
    ]; 

End[]

EndPackage[]


BeginPackage["OptimalFunding`"]

Begin["`Private`"]



End[]

EndPackage[]
