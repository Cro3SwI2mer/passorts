unit custypes;

interface

uses sysutils;

type nat = longint;
type pnat = ^longint;
type pstring = ^string;

type stud = record
	se, ne, me : string;
end;

type nats = array of nat;
type studs = array of stud;

type nat_comparator = function(var n1, n2 : nat): boolean;
type stud_comparator = function(var s1, s2 : stud): boolean;

function lenat(var n1, n2 : nat): boolean;
function genat(var n1, n2 : nat): boolean;

function lnat(var n1, n2 : nat): boolean;
function gnat(var n1, n2 : nat): boolean;

function flestud(var s1, s2 : stud): boolean;
function fgestud(var s1, s2 : stud): boolean;
function nlestud(var s1, s2 : stud): boolean;
function ngestud(var s1, s2 : stud): boolean;
function mlestud(var s1, s2 : stud): boolean;
function mgestud(var s1, s2 : stud): boolean;

function flstud(var s1, s2 : stud): boolean;
function fgstud(var s1, s2 : stud): boolean;
function nlstud(var s1, s2 : stud): boolean;
function ngstud(var s1, s2 : stud): boolean;
function mlstud(var s1, s2 : stud): boolean;
function mgstud(var s1, s2 : stud): boolean;

implementation

function lenat(var n1, n2 : nat): boolean;
	begin
		result := n1 <= n2;
	end;

function genat(var n1, n2 : nat): boolean;
	begin
		result := n1 >= n2;
	end;

function lnat(var n1, n2 : nat): boolean;
	begin
		result := n1 < n2;
	end;

function gnat(var n1, n2 : nat): boolean;
	begin
		result := n1 > n2;
	end;

function flestud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.se, s2.se);
		result := r <= 0;
	end;

function fgestud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.se, s2.se);
		result := r >= 0;
	end;

function nlestud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.ne, s2.ne);
		result := r <= 0;
	end;

function ngestud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.ne, s2.ne);
		result := r >= 0;
	end;

function mlestud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.me, s2.me);
		result := r <= 0;
	end;

function mgestud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.me, s2.me);
		result := r >= 0;
	end;

function flstud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.se, s2.se);
		result := r < 0;
	end;

function fgstud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.se, s2.se);
		result := r > 0;
	end;

function nlstud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.ne, s2.ne);
		result := r < 0;
	end;

function ngstud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.ne, s2.ne);
		result := r > 0;
	end;

function mlstud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.me, s2.me);
		result := r < 0;
	end;

function mgstud(var s1, s2 : stud): boolean;
	var
		r : integer;
	begin
		r := CompareStr(s1.me, s2.me);
		result := r > 0;
	end;

end.
