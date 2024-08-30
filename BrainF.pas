unit BrainF;

interface
function BF_Process(value: Integer): String;
function BF_Loop(cnt, addValue: Integer; op: Char): String;
implementation

function BF_Process(value: Integer): String;
var
	op: Char;
	rst: String;
	i: Integer;
	cntFlag: boolean;
begin
	{
		The program uses only two memory spaces:
		the first one to store the value,
		and the second one to store number of iterations

    the variable 'rst' means 'result'
	}
	cntFlag := false;
	rst := '';
	
	if value > 0 then
	begin
		op := '+';
	end
	else
	begin
		op := '-';
		value := Abs(value);
	end;
	
	while value >= 25 do
	begin
		if cntFlag = false then
		begin
			rst := rst + '>';
			cntFlag := true;
		end;
		
		rst := rst + BF_Loop(5, 5, op);
		value := value - 25;
	end;
	if value >= 5 then
	begin
		if cntFlag = false then
		begin
			rst :=rst + '>';
			cntFlag := true;
		end;
		
		rst := rst + BF_Loop((value div 5), 5, op);
		value := value - (value div 5 * 5);
	end;
	
	if cntFlag = true then
		begin
			rst := rst + '<';
		end;
		
	if value > 0 then
	begin
		for i := 0 to (value - 1) do
		begin
			rst := rst + op;
		end;
	end;
	BF_Process := rst + '.';
end;

function BF_Loop(cnt, addValue: Integer; op: Char): String;
var
	rst: String;
	i: Integer;
begin
	rst := '';
	for i := 0 to (cnt - 1) do
	begin
		rst := rst + '+';
	end;
	rst := rst + '[<';
	for i := 1 to addValue do
	begin
		rst := rst + op;
	end;
	BF_Loop := rst + '>-]';
end;
end.
