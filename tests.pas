program tests;

uses test_utils, test_sorts;

begin
		
	writeln('TESTING_START'); 
	writeln('');

	writeln('UTILS_UNIT_TESTS'); writeln(''); utils_test;
	writeln('SORTS_UNIT_TESTS'); writeln(''); sorts_test;
	
	writeln(''); 
	writeln('TESTING_END'); writeln('');

end.
