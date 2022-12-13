unit utils;

interface

uses sysutils, custypes;

function default_nats(var len : longint): nats;
function random_nats(var len : longint;
					 var max : longint): nats;

function default_studs(var len : longint): studs;

function read_len(var filename : string): longint;

function read_nats(var filename : string): nats;
function read_studs(var filename : string): studs;

procedure write_nats(var filename : string;
					 var arr : nats;
					 var len : longint);

procedure write_studs(var filename : string;
					  var arr : studs;
					  var len : longint);

procedure print_nats(var arr : nats;
					 var len : longint);

procedure print_stud(var st : stud);
procedure print_studs(var arr : studs;
					  var len : longint);

procedure swap_nat(var b1, b2 : nat);
procedure swap_stud(var s1, s2 : stud);

implementation

function default_nats(var len : longint): nats;
	var
		arr : nats;
	
	begin
		Setlength(arr, len);
		result := arr;
	end;

function random_nats(var len : longint;
					 var max : longint): nats;
	var
		arr : nats;
		i : longint;
	
	begin
		randomize;
		if len < 1 then
			begin
				writeln('Length of the array should be positive!')
			end
		else
			begin
				Setlength(arr, len);
				for i := 0 to len-1 do
					begin
						arr[i] := random(max) + 1;
					end;
				result := arr;
			end;
	end;

function default_studs(var len : longint): studs;
	var
		arr : studs;
	
	begin
		Setlength(arr, len);
		result := arr;
	end;

function read_len(var filename : string): longint;	
	var
		tfinput : textfile;
		len : longint;
	
	begin
		AssignFile(tfinput, filename);
		try
			reset(tfinput);
			readln(tfinput, len);
			CloseFile(tfinput);
			result := len;
		except
			on E: EinOutError do
				writeln(E.ClassName, ' : ', E.Message);
		end;
	end;

function read_nats(var filename : string): nats;	
	var
		tfinput : textfile;
		i, len, curr : longint;
		arr : nats;
	
	begin
		AssignFile(tfinput, filename);
		try
			reset(tfinput);
			readln(tfinput, len);
			arr := default_nats(len);
			i := 0;
			while (not eof(tfinput)) and (i < len) do
				begin
					read(tfinput, curr);
					arr[i] := curr;
					i := i + 1;
				end;
			CloseFile(tfinput);
			result := arr;
		except
			on E: EinOutError do
				writeln(E.ClassName, ' : ', E.Message);
		end;
	end;

function read_studs(var filename : string): studs;
	var
		tfinput : textfile;
		i, len : longint;
		p : integer;
		sl, se, ne : string;
		elem : stud;
		arr : studs;

	begin
		AssignFile(tfinput, filename);
		try
			reset(tfinput);
			readln(tfinput, len);
			arr := default_studs(len);
			i := 0;
			while (not eof(tfinput)) and (i < len) do
				begin
					readln(tfinput, sl);
					p := pos(' ', sl); se := copy(sl, 1, p-1); delete(sl, 1, p);
					p := pos(' ', sl); ne := copy(sl, 1, p-1); delete(sl, 1, p);
					elem.se := se; elem.ne := ne; elem.me := sl;
					arr[i] := elem;
					i := i + 1;
				end;
			CloseFile(tfinput);
			result := arr;
		except
			on E: EinOutError do
				writeln(E.ClassName, ' : ', E.Message);
		end;
	end;

procedure write_nats(var filename : string;
					 var arr : nats;
					 var len : longint);
	var
		tfout : textfile;
		i : longint;

	begin
		AssignFile(tfout, filename);
		try
			rewrite(tfout);
			writeln(tfout, len);
			for i := 0 to len-1 do
				begin
					write(tfout, arr[i]); write(tfout, ' ');
				end;
			CloseFile(tfout);
		except
			on E: EInOutError do
				writeln(E.ClassName, ' : ', E.Message);
		end;
	end;

procedure write_studs(var filename : string;
					  var arr : studs;
					  var len : longint);
	var
		tfout : textfile;
		i : longint;
	
	begin
		AssignFile(tfout, filename);
		try
			rewrite(tfout);
			writeln(tfout, len);
			for i := 0 to len-1 do
				begin
					writeln(tfout, arr[i].se, ' ', arr[i].ne, ' ', arr[i].me);
				end;
			CloseFile(tfout);
		except
			on E: EInOutError do
				writeln(E.ClassName, ' : ', E.Message);
		end;
	end;

procedure print_nats(var arr : nats;
					 var len : longint);
	var
		i : longint;
	
	begin
		for i := 0 to len-1 do
			begin
				write(arr[i]); write(' ');
			end;
		writeln('');
	end;

procedure print_stud(var st : stud);

	begin
		writeln(st.se, ' ', st.ne, ' ', st.me);
	end;

procedure print_studs(var arr : studs;
					  var len : longint);
	var
		i : longint;
	
	begin
		for i := 0 to len-1 do
			begin
				print_stud(arr[i]);
			end;
	end;

procedure swap_nat(var b1, b2 : nat);
	var
		tmp : nat;

	begin
		tmp := b1;
		b1 := b2;
		b2 := tmp;
	end;

procedure swap_stud(var s1, s2 : stud);
	var
		tmp : stud;

	begin
		tmp := s1;
		s1 := s2;
		s2 := tmp;
	end;

end.
