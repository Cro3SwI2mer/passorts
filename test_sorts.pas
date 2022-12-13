unit test_sorts;

interface

uses custypes, utils, sorts;

procedure shuttle_nat_random_test(var num : longint; 
								  var m : longint;
								  var omod : longint;
								  od : boolean);

procedure quick_nat_random_test(var num : longint; 
								var m : longint;
								var omod : longint;
								od : boolean);

procedure shuttle_stud_test(var fname : string; 
							var omod : longint;
							cmr : stud_comparator);

procedure quick_stud_test(var fname : string; 
						  var omod : longint;
						  cmr : stud_comparator);

procedure sorts_test;

implementation

procedure shuttle_nat_random_test(var num : longint; 
								  var m : longint;
								  var omod : longint;
								  od : boolean);
	var
		arr : nats;
		cmr : nat_comparator;

	begin
		writeln('Shuttle sort test on numbers'); writeln('');

		arr := random_nats(num, m);
		write('Initial numbers: '); print_nats(arr, num);
	
		writeln('');
		
		if od then cmr := @lenat
		else cmr := @genat;

		shuttle_nats(arr, num, cmr, omod); writeln('');
		write('After shuttle sort: '); print_nats(arr, num);
	end;

procedure quick_nat_random_test(var num : longint; 
								var m : longint;
								var omod : longint;
								od : boolean);
	var
		arr : nats;
		cmr : nat_comparator;

	begin
		writeln('Quick sort test on numbers'); writeln('');

		arr := random_nats(num, m);
		write('Initial numbers: '); print_nats(arr, num);
	
		writeln('');
		
		if od then cmr := @lnat
		else cmr := @gnat;

		quick_nats(arr, num, cmr, omod); writeln('');
		write('After quick sort: '); print_nats(arr, num);
	end;

procedure shuttle_stud_test(var fname : string; 
							var omod : longint;
							cmr : stud_comparator);
	var
		len : longint;
		arr : studs;

	begin
		len := read_len(fname);
		arr := read_studs(fname);
		
		writeln('Shuttle sort test on students'); writeln('');
		writeln('Initial students: '); print_studs(arr, len);
		
		writeln(''); shuttle_studs(arr, len, cmr, omod); writeln('');
		
		writeln('After shuttle sort: '); print_studs(arr, len);
	end;

procedure quick_stud_test(var fname : string; 
						  var omod : longint;
						  cmr : stud_comparator);
	var
		len : longint;
		arr : studs;

	begin
		len := read_len(fname);
		arr := read_studs(fname);
		
		writeln('Quick sort test on students'); writeln('');
		writeln('Initial students: '); print_studs(arr, len);
		
		writeln(''); quick_studs(arr, len, cmr, omod); writeln('');
		
		writeln('After quick sort: '); print_studs(arr, len);
	end;

procedure sorts_test;
	var
		num : longint;
		omod : integer;
		m : longint;
		fstuds : string;

	begin
		m := 98;
		fstuds := 'fstudseng.txt';

		write('OPERATING_MODE: '); readln(omod);
		write('Array length: '); readln(num);
	
		writeln(''); shuttle_nat_random_test(num, m, omod, true); writeln('');
		writeln(''); shuttle_nat_random_test(num, m, omod, false); writeln('');
		
		writeln(''); quick_nat_random_test(num, m, omod, true); writeln('');
		writeln(''); quick_nat_random_test(num, m, omod, false); writeln('');
		
		writeln(''); shuttle_stud_test(fstuds, omod, @flestud); writeln('');
		writeln(''); shuttle_stud_test(fstuds, omod, @fgestud); writeln('');
		writeln(''); shuttle_stud_test(fstuds, omod, @nlestud); writeln('');
		writeln(''); shuttle_stud_test(fstuds, omod, @ngestud); writeln('');
		writeln(''); shuttle_stud_test(fstuds, omod, @mlestud); writeln('');
		writeln(''); shuttle_stud_test(fstuds, omod, @mgestud); writeln('');

		writeln(''); quick_stud_test(fstuds, omod, @flstud); writeln('');
		writeln(''); quick_stud_test(fstuds, omod, @fgstud); writeln('');
		writeln(''); quick_stud_test(fstuds, omod, @nlstud); writeln('');
		writeln(''); quick_stud_test(fstuds, omod, @ngstud); writeln('');
		writeln(''); quick_stud_test(fstuds, omod, @mlstud); writeln('');
		writeln(''); quick_stud_test(fstuds, omod, @mgstud); writeln('');
	end;

end.
