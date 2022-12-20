program TASK_17_1;

uses custypes, utils, sorts;

var
	len, max, omod : longint;
	arr : nats;
	cmr : nat_comparator;

begin
	
	max := 998; omod := 0; cmr := @lnat; 
	readln(len);
	arr := random_nats(len, max);
	writeln('Initial array: '); print_nats(arr, len); writeln('');
	quick_nats(arr, len, cmr, omod);
	writeln('Sorted array: '); print_nats(arr, len); writeln('');

end.
