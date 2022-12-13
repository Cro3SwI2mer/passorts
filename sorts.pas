unit sorts;

interface

uses sysutils, custypes, utils;

procedure shuttle_nats(var arr : nats; 
					   var len : longint;
					   comparator : nat_comparator;
					   var om : integer);

procedure shuttle_studs(var arr : studs;
						var len : longint;
						comparator : stud_comparator;
						var om : integer);

procedure quick_nats_help(var arr : nats; 
						  var len, left, right : longint;
						  comparator : nat_comparator;
						  var om : integer;
						  var comps, moves : longint);

procedure quick_studs_help(var arr : studs; 
						   var len, left, right : longint;
						   comparator : stud_comparator;
						   var om : integer;
						   var comps, moves : longint);


procedure quick_nats(var arr : nats;
					 var len : longint;
					 var comparator : nat_comparator;
					 var om : longint);

procedure quick_studs(var arr : studs;
					  var len : longint;
					  var comparator : stud_comparator;
					  var om : longint);

implementation

procedure shuttle_nats(var arr : nats;
					   var len : longint;
					   comparator : nat_comparator;
					   var om : integer);
	var
		comps, moves, curr, i : longint;
	
	begin
		comps := 0; moves := 0;
		if len > 1 then
			begin
				curr := 1;
				try
					while (curr < len) do
						begin
							comps := comps + 1;
							if comparator(arr[curr-1], arr[curr]) then curr := curr + 1
							else
								begin
									i := curr;
									while (i > 0) and (not comparator(arr[i-1], arr[i])) do
										begin
											comps := comps + 1;
											moves := moves + 1;
											swap_nat(arr[i-1], arr[i]);
											i := i - 1;
											if om = 1 then print_nats(arr, len);
										end;
									curr := curr + 1;	
								end;	
						end;
				except
					on E: EAccessViolation do
						writeln(E.ClassName, ' : ', E.Message);
				end;
			end
		else writeln('Array consists of 1 element.');
		writeln('Comparisons: ', comps);
		writeln('Movements: ', moves);
	end;

procedure shuttle_studs(var arr : studs;
						var len : longint;
						comparator : stud_comparator;
						var om : integer);
	var
		comps, moves, curr, i : longint;

	begin
		comps := 0; moves := 0;
		if len > 1 then
			begin
				curr := 1;
				try
					while (curr < len) do
						begin
							comps := comps + 1;
							if comparator(arr[curr-1], arr[curr]) then curr := curr + 1
							else
								begin
									i := curr;
									while (i > 0) and (not comparator(arr[i-1], arr[i])) do
										begin
											comps := comps + 1;
											moves := moves + 1;
											swap_stud(arr[i-1], arr[i]);
											i := i - 1;
											if om = 1 then
												begin
													print_studs(arr, len); writeln('');
												end
										end;
									curr := curr + 1;
								end;	
						end;
				except
					on E: EAccessViolation do
						begin
							writeln(E.ClassName, ' : ', E.Message);
							writeln('curr: ', curr:2);
							writeln('i: ', i:2);
							writeln('');
						end;
				end;
			end
		else writeln('Array consists of 1 element.');
		writeln('Comparisons: ', comps);
		writeln('Movements: ', moves);
	end;

procedure quick_nats_help(var arr : nats; 
						  var len, left, right : longint;
						  comparator : nat_comparator;
						  var om : integer;
						  var comps, moves : longint);
	var
		med, lb, rb : longint;
		pivot : nat;

	begin
		if len > 1 then
			begin
				lb := left; rb := right;
				med := (left + right) div 2; 
				pivot := arr[med];
				repeat	
					while comparator(arr[lb], pivot) do
						begin
							comps := comps + 1;
							lb := lb + 1;
						end;
					while comparator(pivot, arr[rb]) do
						begin
							comps := comps + 1;
							rb := rb - 1;
						end;
					if (lb <= rb) then
						begin
							moves := moves + 1;
							swap_nat(arr[lb], arr[rb]);
							lb := lb + 1; rb := rb - 1;
							if om = 1 then print_nats(arr, len);
						end;
				until lb > rb;
				if left < rb then quick_nats_help(arr, len, left, rb, comparator, om, comps, moves);
				if lb < right then quick_nats_help(arr, len, lb, right, comparator, om, comps, moves);
			end
		else writeln('Array consists of 1 element.');
		if (left = 0) and (right = len - 1) then
			begin
				writeln('Comparisons: ', comps);
				writeln('Movements: ', moves);
			end
	end;

procedure quick_studs_help(var arr : studs; 
						   var len, left, right : longint;
						   comparator : stud_comparator;
						   var om : integer;
						   var comps, moves : longint);
	var
		med, lb, rb : longint;
		pivot : stud;

	begin
		if len > 1 then
			begin
				lb := left; rb := right;
				med := (left + right) div 2; 
				pivot := arr[med];
				repeat	
					while comparator(arr[lb], pivot) do
						begin
							comps := comps + 1;
							lb := lb + 1;
						end;
					while comparator(pivot, arr[rb]) do
						begin
							comps := comps + 1;
							rb := rb - 1;
						end;
					if (lb <= rb) then
						begin
							moves := moves + 1;
							swap_stud(arr[lb], arr[rb]);
							lb := lb + 1; rb := rb - 1;
							if om = 1 then
								begin
									print_studs(arr, len); writeln('');
								end
						end;
				until lb > rb;
				if left < rb then quick_studs_help(arr, len, left, rb, comparator, om, comps, moves);
				if lb < right then quick_studs_help(arr, len, lb, right, comparator, om, comps, moves);
			end
		else writeln('Array consists of 1 element.');
		if (left = 0) and (right = len - 1) then
			begin
				writeln('Comparisons: ', comps);
				writeln('Movements: ', moves);
			end
	end;

procedure quick_nats(var arr : nats;
					 var len : longint;
					 var comparator : nat_comparator;
					 var om : longint);
	var
		comps, moves, left, right : longint;
	
	begin
		comps := 0; moves := 0;
		left := 0; right := len - 1;
		quick_nats_help(arr, len, left, right, comparator, om, comps, moves);
	end;

procedure quick_studs(var arr : studs;
					  var len : longint;
					  var comparator : stud_comparator;
					  var om : longint);
	var
		comps, moves, left, right : longint;
	
	begin
		comps := 0; moves := 0;
		left := 0; right := len - 1;
		quick_studs_help(arr, len, left, right, comparator, om, comps, moves);
	end;
		
end.
