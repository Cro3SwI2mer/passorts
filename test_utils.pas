unit test_utils;

interface

uses sysutils, custypes, utils;

procedure utils_test;

implementation

procedure utils_test;
	var
		nats1, nats2, nats3 : nats;
		studs1, studs2, studs3 : studs;
		num, m, len_nats, len_studs : longint;
		fnats, fstuds, outstuds : string;
		a, b : nat;
		s1, s2 : stud;

	begin	
		fnats := 'fnats.txt';
		fstuds := 'fstudseng.txt';
		outstuds := 'outstuds.txt';

		write('Array length: '); readln(num);
		write('Default right border: '); m := 98; writeln(m:2);
		
		writeln('');
		
		nats1 := default_nats(num);
		nats2 := random_nats(num, m);
			
		write('Default array: '); print_nats(nats1, num); 
		write('Random array: '); print_nats(nats2, num);
	
		writeln('');
	
		write_nats(fnats, nats2, num);
		nats3 := read_nats(fnats);
	
		len_nats := read_len(fnats);
		write('Array from file: '); print_nats(nats3, len_nats);
	
		writeln('');
	
		a := 1; b := 2;
		writeln('Before swap: ', 'a = ', a:1, ', ', 'b = ', b:1);
		swap_nat(a, b); 
		writeln('After swap: ', 'a = ', a:1, ', ', 'b = ', b:1);
	
		writeln('');

		studs1 := default_studs(num);

		len_studs := read_len(fstuds);
		studs2 := read_studs(fstuds);
		writeln('Students: '); print_studs(studs2, len_studs);
	
		writeln('');

		write_studs(outstuds, studs2, len_studs);
		studs3 := read_studs(outstuds);

		s1 := studs3[0]; s2 := studs3[1];
		writeln('Before swap: ');
		write('First student: '); print_stud(s1);
		write('Second student: '); print_stud(s2);
	
		writeln('');
	
		swap_stud(s1, s2);
	
		writeln('After swap: ');
		write('First student: '); print_stud(s1);
		write('Second student: '); print_stud(s2);

		writeln('');
		
		write('Initial nats: '); print_nats(nats3, len_nats); writeln('');
		shuffle_nats(nats3);
		write('Shuffled nats: '); print_nats(nats3, len_nats); writeln('');

		writeln('');

	end;

end.
