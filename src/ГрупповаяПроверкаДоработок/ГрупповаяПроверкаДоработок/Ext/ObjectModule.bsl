﻿#Если Сервер ИЛИ ТолстыйКлиент Тогда

Функция СведенияОВнешнейОбработке() Экспорт
	
	ПараметрыРегистрации = ДополнительныеОтчетыИОбработки.СведенияОВнешнейОбработке("2.2.2.1");
    ПараметрыРегистрации.Вид = ДополнительныеОтчетыИОбработкиКлиентСервер.ВидОбработкиДополнительнаяОбработка();
    ПараметрыРегистрации.Версия = "1.7.8";
	
	Команда = ПараметрыРегистрации.Команды.Добавить();
    Команда.Представление = НСтр("ru = 'Групповая проверка доработок'");
    Команда.Идентификатор = "ГрупповаяПроверкаДоработок";
    Команда.Использование = ДополнительныеОтчетыИОбработкиКлиентСервер.ТипКомандыОткрытиеФормы();
	
	Возврат ПараметрыРегистрации;
	
КонецФункции

#КонецЕсли