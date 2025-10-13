-- 합집합 (중복x)
(select 1 union select 2 union select 3)
union
(select 1 union select 2 union select 5);

-- 합집합 (중복 o, 섞질 않음)
(select 1 union select 2 union select 3)
union all
(select 1 union select 2 union select 5);

-- 교집합
(select 1 union select 2 union select 3)
intersect
(select 1 union select 2 union select 5);

-- 차집합 (a - b)
(select 1 union select 2 union select 3)
except
(select 1 union select 2 union select 5);
