#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ИмяОбласти
	
Перем Перем1, Перем2 Экспорт;
	
#Если Сервер Тогда

// Тестируем смарт-коммиты
// С первого раза не взлетело
// И со второго тоже :-(
// Проверяем отправку уведомлений о черновиках ревью
// Эпик-фейл - не проверил, что работает почтовая рассылка с сервера crucible
// Очередная проверка смарт-коммитов, только теперь уже собственных
// Не взлетели кастомные смарт-коммиты 
// Очередной тест
// Отладка кастомных коммитов. Новая (легкая) версия. Дубль 6
// Проверка создания ревью...........................

// Комментарий процедуры
// Еще 1 строка комментария
&НаСервере
Процедура ИмяПроцедуры(
	Знач ПараметрПоЗначению,
	ПараметрПоСсылке,
	ПараметрПоУмолчанию = Неопределено,
	ПараметрНеобязательный = Нелегальщина) Экспорт
	
	#Область Переменнные
	
	Да = Истина;
	Нет = Ложь;
	
	#КонецОбласти
	
	а = ?(Не ЗначениеЗаполнено(Неопределено), "", "Есть значение");
	Б = "текст с ""кавычками"" и " + " конкатенацией";
	В = "многострочный
	|текст
	// разбитый комментарием
	|с продолжением после комментария
	|";
	
	г = "";

	УсловиеИ = Истина И Ложь;
	УсловиеИли = Истина Или Ложь;
	УсловиеНе = Не Истина;
	
	Перем1 = 123;
	Перем2 = "123";
	Перем3 = "текст123текст";
	
	Идентификатор = Новый УникальныйИдентификатор("814d41ec-82e2-4d25-9334-8335e589fc1f");
	
КонецПроцедуры

#КонецЕсли

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
	Результат = Запрос.Выполнить();
	
	Если Результат.Пустой() Тогда
		ВызватьИсключение "Ошибка";
	КонецЕсли;
	 	
	Выборка = Результат.Выбрать();
	Пока Выборка.Следующий() Цикл
		ПоказатьОповещениеПользователя(Выборка.Ссылка);
		Продолжить;		
	КонецЦикла;

	Возврат Ложь;
				 
КонецФункции

#КонецОбласти

#КонецЕсли