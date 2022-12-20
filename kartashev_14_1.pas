program TASK_14_1;

uses custypes, utils, sorts; 

var
	f1, f2, f3, f4, f5, f6 : string;
	len, len1, len2, max, omod, i, j : longint;
	arr1, arr2, arr3, arr4, arr4_1, arr4_2, arr4_3, arr5, arr5_1, arr5_2, arr5_3, arr6 : nats;
	cmr1, cmr2 : nat_comparator; 

begin

	omod := 0; max := 98;
	cmr1 := @lnat; cmr2 := @gnat;

	f1 := 'f_n_initial.txt';
	f2 := 'f_n_up.txt';
	f3 := 'f_n_down.txt';
	f4 := 'f_n_up_and_down.txt';
	f5 := 'f_n_half.txt';
	f6 := 'f_n_random.txt';
	
	write('Input array length: '); readln(len);

	writeln('');

	arr1 := random_nats(len, max);
	writeln('Random nats: '); print_nats(arr1, len); writeln('');
	write_nats(f1, arr1, len);

	arr2 := random_nats(len, max);
	writeln('Random nats: '); print_nats(arr2, len); writeln('');
	quick_nats(arr2, len, cmr1, omod);
	writeln('Sorted array: '); print_nats(arr2, len); writeln('');
	write_nats(f2, arr2, len);

	arr3 := random_nats(len, max);
	writeln('Random nats: '); print_nats(arr3, len); writeln('');
	quick_nats(arr3, len, cmr2, omod);
	writeln('Sorted array: '); print_nats(arr3, len); writeln('');
	write_nats(f3, arr3, len);

	if len mod 2 = 0 then
		begin
			len1 := len div 2;
			len2 := len1;
		end
	else
		begin
			len1 := (len div 2) + 1;
			len2 := len1 - 1;
		end;
	writeln('Len1: ', len1); writeln('Len2: ', len2); writeln('');

	arr4 := random_nats(len, max);
	writeln('Random nats: '); print_nats(arr4, len); writeln('');
	SetLength(arr4_1, len1); SetLength(arr4_2, len2);
	i := 0; j := 0;
	while i < len do
		begin
			arr4_1[j] := arr4[i];
			j := j + 1; i := i + 2;
		end;
	i := 1; j := 0;
	while i < len do
		begin
			arr4_2[j] := arr4[i];
			j := j + 1; i := i + 2;
		end;
	print_nats(arr4_1, len1); writeln('');
	print_nats(arr4_2, len2); writeln('');
	quick_nats(arr4_1, len1, cmr1, omod); quick_nats(arr4_2, len2, cmr2, omod);
	SetLength(arr4_3, len);
	i := 0; j := 0;
	while i < len do
		begin
			arr4_3[i] := arr4_1[j];
			j := j + 1; i := i + 2;
		end;
	i := 1; j := 0;
	while i < len do
		begin
			arr4_3[i] := arr4_2[j];
			j := j + 1; i := i + 2;
		end;
	writeln('Sorted array: '); print_nats(arr4_3, len); writeln('');
	write_nats(f4, arr4_3, len);

	arr5 := random_nats(len, max);
	writeln('Random nats: '); print_nats(arr5, len); writeln('');
	SetLength(arr5_1, len1); SetLength(arr5_2, len2);
	i := 0;
	while i < len1 do
		begin
			arr5_1[i] := arr5[i];
			i := i + 1;
		end;
	i := 0;
	while i < len2 do
		begin
			arr5_2[i] := arr5[i + len1];
			i := i + 1;
		end;
	print_nats(arr5_1, len1); writeln('');
	print_nats(arr5_2, len2); writeln('');
	quick_nats(arr5_1, len1, cmr1, omod); quick_nats(arr5_2, len2, cmr2, omod);
	SetLength(arr5_3, len);
	i := 0;
	while i < len1 do
		begin
			arr5_3[i] := arr5_1[i];
			i := i + 1;
		end;
	i := 0;
	while i < len2 do
		begin
			arr5_3[i + len1] := arr5_2[i];
			i := i + 1;
		end;
	writeln('Sorted array: '); print_nats(arr5_3, len); writeln('');
	write_nats(f5, arr5_3, len);

	arr6 := read_nats(f1);
	writeln('Array from f_n_initial: '); print_nats(arr6, len); writeln('');
	shuffle_nats(arr6);
	writeln('Shuffled nats: '); print_nats(arr6, len); writeln('');
	write_nats(f6, arr6, len);

end.
