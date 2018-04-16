#Region RegionName
	
Var Var1, Var2 Export;

#If Server Then
	
		
// Procedure comment
// 
&AtServer
Procedure procedureName(Val value1, 
	value2, 
	value3 = Undefined,
	value4 = Something) Export
	
	Yes = True;
	No = False;

	a = ?(Not ValueIsFilled(Undefined), "", "success");
	B = "some text with ""quotes"" and " + "concatenation";
	C = "multiline
	|text
	// commented
	|with the continuation after the comment
	|";
	
	emptyString = "";

	AndExp = True And False;
	OrExp = True Or False;
	NotExp = Not True;
	
EndProcedure

#Endif

&AtClient
Function functionName(One, Two, Three)
	
	DocsByTypes = New Structure; // Inline comment
	For Each Pair In DocsByTypes Do
		QueryText = QueryText + ?(QueryText = "", "
		|SELECT ", "
		|UNION ALL
		|SELECT ") + "
		|Дата, Ссылка, Представление, Проведен, ПометкаУдаления,
		|ISNULL(СуммаДокумента, NULL) AS СуммаДокумента
		|FROM Document." + Pair.Key + "
		|WHERE Ссылка IN(&" + Pair.Value + ")"
	EndDo;

	Query = new Query;
	Query.Text = QueryText
	
	result = Query.Execute();
	
	If (result.IsEmpty()) Then
		Raise "Error";
	EndIf;
	
	Select = result.Select();
	While (Select.Next()) Do
		ShowUserNotification(Select.Ссылка);
		Continue;
	EndDo;

	Return False;
	
EndFunction
	
#EndRegion