% ARTI 401 - Lab 12: Paths between cities
% Each road follows one arrow. Al-Qatif is written as 'Qatif' in the queries.
road('Makkah',  'Madinah').
road('Makkah',  'Riyadh').
road('Madinah', 'Makkah').
road('Madinah', 'Taif').
road('Madinah', 'Tabuk').
road('Taif',    'Dammam').
road('Taif',    'Tabuk').
road('Tabuk',   'Taif').
road('Dammam',  'Qatif').
road('Dammam',  'Riyadh').
road('Qatif',   'Madinah').
road('Qatif',   'Dammam').
road('Riyadh',  'Dammam').

% travel(From, To, Path) finds paths of one or more roads.
travel(From, To, Path) :-
    follow_road(From, To, [From], Path).

follow_road(Current, To, Visited, [Current | Rest]) :-
    road(Current, Next),
    \+ memberchk(Next, Visited),
    (   Rest = [Next], To = Next
    ;   follow_road(Next, To, [Next | Visited], Rest)
    ).

% Example queries. Type ; after a result to ask for another path.
% ?- travel('Dammam', 'Madinah', P).
% ?- travel('Riyadh', 'Makkah', P).
% ?- travel('Makkah', 'Riyadh', P).
% ?- travel('Makkah', 'Madinah', P).
