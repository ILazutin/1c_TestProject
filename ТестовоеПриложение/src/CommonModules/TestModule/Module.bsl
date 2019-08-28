#If Server Or ThickClientOrdinaryApplication Or ExternalConnection Then

#Region RegionName
	
Var Var1, Var2 Export;

#If Server Then

// Test review creation	
// Update review
		
// Procedure comment
// 
&AtServer
Procedure procedureName(Val value1, 
	value2, 
	value3 = Undefined,
	value4 = Something) Export
	
	#Region Variables
	
	Yes = True;
	No = False;
	
	#EndRegion
	
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
	
	Var1 = 123;
	Var2 = "123";
	Var3 = "some123text";
	
	Id = New UUID("814d41ec-82e2-4d25-9334-8335e589fc1f");
		
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

#EndIf