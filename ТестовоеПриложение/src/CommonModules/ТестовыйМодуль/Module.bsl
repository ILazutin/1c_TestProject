#Область ИмяОбласти
	
	Перем Абвгд Экспорт;
	
#Если Сервер Тогда

// Комментарий процедуры
// Еще 1 строка комментария
&НаСервере
Процедура ИмяПроцедуры(
	Знач ПараметрПоЗначению
	ПараметрПоСсылке
	ПараметрНеобязательный = Нелегальщина
	ПараметрПоУмолчанию = Неопределено) Экспорт
	
	а = ?(Не ЗначениеЗаполнено(Неопределено), "", "Есть значение");
	Б = "текст с ""кавычками"" и " + " конкатенацией";
	В = "многострочный
	|текст
	// разбитый комментарием
	|с продолжением после комментария
	|";
	
	г = "";

КонецПроцедуры

&НаКлиенте
Функция ИмяФункции(Раз, Два, Три)

	ДокументыПоТипам = Новый Структура; // Inline comment
	Для Каждого КлючЗначение Из ДокументыПоТипам Цикл
		ТекстЗапроса = ТекстЗапроса + ?(ТекстЗапроса = "", "
		|ВЫБРАТЬ ", "
		|ОБЪЕДИНИТЬ ВСЕ
		|ВЫБРАТЬ") + "
		|Дата, Ссылка, Представление, Проведен, ПометкаУдаления,
		|ЕСТЬNULL(СуммаДокумента, NULL) КАК СуммаДокумента
		|ИЗ Документ." + КлючЗначение.Ключ + "
		|ГДЕ Ссылка В(&" + КлючЗначение.Значение + ")";
	КонецЦикла;

	Запрос = Новый Запрос;
	Запрос.Текст = ТекстЗапроса;
	Выборка = Запрос.Выполнить().Выбрать();
	
	Пока Выборка.Следующий() Цикл
		ПоказатьОповещениеПользователя(Выборка.Ссылка);		
	КонецЦикла
			 
КонецФункции

#КонецОбласти