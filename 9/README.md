The current solution for day 9 part 2 is very fast, but it feels like it might be working by
coincidence. I've tested it against three different inputs successfully. However, it definitely
will not test every possible range. It relies on the idea that if the total for the current
range is too small, you should take numbers on the right, and if it's too large, you should
drop them on the left. It's basically a greedy algorithm, relying on the idea that the
numbers on the right will tend to be larger. However, they are not guaranteed to be larger,
and I can't shake the feeling that there is some degenerate input for which the algorithm
will fail to terminate.

If you look in the commit history there is a slower solution that is guaranteed to be
correct because it will exhaustively check all subranges until a solution is found.
