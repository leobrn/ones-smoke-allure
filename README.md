# Дымовые тесты для 1С и вывод результата в отчет Allure

[![telegram](https://img.shields.io/badge/telegram-chat-green.svg)](http://t.me/ovmst)
[![Stars](https://img.shields.io/github/stars/leobrn/ones-smoke-allure.svg?label=Github%20%E2%98%85&a)](https://github.com/leobrn/ones-smoke-allure/stargazers)
[![Release](https://img.shields.io/github/v/release/leobrn/ones-smoke-allure?include_prereleases&label=last%20release&style=badge)](https://github.com/leobrn/ones-smoke-allure/releases/latest)
[![download](https://img.shields.io/github/downloads/leobrn/ones-smoke-allure/total)](https://github.com/leobrn/ones-smoke-allure/releases/latest/download/GruppovayaProverkaDorabotok.epf)
[![OpenYellow](https://img.shields.io/endpoint?url=https://openyellow.neocities.org/badges/2/394873279.json)](https://openyellow.notion.site/openyellow/24727888daa641af95514b46bee4d6f2?p=33af15f9239e4482aa84b084d8d3734e&amp;pm=s)

Видео примеры:
- <a href="https://youtu.be/hVGjl_lW4Pg" target="_blank">VanessaRunner. Проверяем доработки после обновления с помощью внешней обработки</a>

Содержание:
- [Установка](#установка)
- [Создание проекта](#создание-проекта)
- [Описание команд](#описание-команд)
- [Групповая проверка доработок](#групповая-проверка-доработок)
- [Дымовые тесты](#дымовые-тесты)
- [Информация о поддержке метаданных](#информация-о-поддержке-метаданных)  
- [Синтаксическая проверка](#синтаксическая-проверка)
- [Проверка кода](#проверка-кода)
- [Дополнительные материалы](#доп-материалы)

<a id="markdown-установка" name="#установка"></a>

## Установка

- <a href="https://github.com/leobrn/ones-smoke-allure/blob/main/doc/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D1%8F%20%D0%BF%D0%BE%20%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B5%20%D0%B4%D0%BB%D1%8F%20%D0%B0%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%82%D0%BE%D1%80%D0%BE%D0%B2.txt" target="_blank">Инструкция по установке</a>
- <a href="https://github.com/vanessa-opensource/vanessa-runner/blob/develop/README.md" target="_blank">Настройка vanessa runner (файл .env)</a>

Предусмотрен запуск Allure в Docker

<a id="управление-дымовыми-тестами" name="#управление-дымовыми-тестами"></a>

### Создание проекта

<a id="markdown-создание-проекта" name="#создание-проекта"></a>

С версии `1.11.0` <a href="https://github.com/vanessa-opensource/vanessa-runner" target="_blank">vanessa-runner</a> доступна команда `init-project`.

С ее помощью можно быстро развернуть проект следующими командами:

- `vrunner init-project --template https://github.com/leobrn/ones-smoke-allure.git` 
- `vrunner init-project --settings my-path/env.json`

При создании проекта сразу будут собраны обработки.

<a id="markdown-описание-команд" name="#описание-команд"></a>

## Описание команд

- `installVA.cmd` - обновление пакетов onescript, установка vanessa-runner, vanessa-add, vanessa-support
- `runSyntax.cmd` - запуск синтаксической проверки
- `runSmoke.cmd` - запуск дымовых тестов
- `runAllure.cmd` - формирование отчета Allure. Предусмотрено сохранение истории
- `runTests.cmd` - запуск трех команд: runSyntax, runSmoke, runAllure
- `compileEpf.cmd` - cборка внешних обработок из исходников
- `decompileEpf.cmd` - разборка внешних обработок на исходники
- `decompileCf.cmd` - разборка конфигурации в исходники
- `getSupportObjects.cmd` - получить json-файл для всех метаданных, которые могут быть изменены и не находятся в режиме чтения
- `runGroupCheck.cmd` - запуск 1С:Предприятие с запуском обработки `ГрупповаяПроверкаДоработок.epf`

## Групповая проверка доработок

*Альтернативный способ проверки*

Обработка для массовой проверки доработок типовой конфигурации: Открытие форм, Печать, Формирование отчетов, Проведение документов, Запись справочников, ПВХ, ПВР. Выдает список обнаруженных ошибок. Рекомендуется применять для тестирования обновленной конфигурации.

Поддерживаемые конфигурации:

- 1С:ERP Управление предприятием 2
- Комплексная автоматизация, редакция 2
- Управление торговлей, редакция 11
- Бухгалтерия предприятия, редакция 3.0 / КОРП
- Зарплата и Управление Персоналом, редакция 3 / КОРП

 *За основу использовалась обработка с инфостарта <a href="https://infostart.ru/public/1056811/" target="_blank">Групповая проверка доработок</a>*.

 <img src="https://raw.githubusercontent.com/leobrn/ones-smoke-allure/main/examples/group-check.png" alt="Групповая проверка доработок" style="zoom:80%;" />

5 режимов проверки:
- Формы. Проверка открытия основных форм объектов (справочников и документов)
- Отчеты. Формирование отчетов с настройками по умолчанию
- Печать. Формирование печатных формы с настройками по умолчанию
- Документы. Проверяет заполнение формы и перепроводит последние документы
- Справочники. Проверяет заполнение формы и перезаписывает справочники, планы видов характеристик, планы видов расчета

Выбранные проверки выполняются по порядку.

На страницах тестов `Формы, Печать, Документы, Справочники` есть настройка `Сколько объектов одного типа проверять`.

Проверка доработок в расширениях в три шага:

- В шапке обработки нажать `Заполнить объекты` (все настройки и заполненные объекты сохраняются)
- Нажать `Объекты расширений`. Будут выбраны объекты, которые добавлены или изменены в расширениях. Для показа только выбранных объектов нажмите `Только выбранные`
- Запустить проверки нажав на `Проверить`

 <img src="https://raw.githubusercontent.com/leobrn/ones-smoke-allure/main/examples/group-check-selected.png" alt="Выбранные объекты" style="zoom:80%;" />

На странице `Результат` в виде дерева отображены ошибки с группировкой по полю `Тип ошибки`.

- Тип ошибки
- Описание (информация о возникшей ошибке, содержащая указание на модуль и строку ошибки, а также навигационную ссылку на объект)
- Проверяемый объект (имя объекта метаданных)
- Данные (ссылка на объект в базе)

 <img src="https://raw.githubusercontent.com/leobrn/ones-smoke-allure/main/examples/group-check-result.png" alt="Результат проверки" style="zoom:80%;" />

На странице `Настройки` доступны следующие настройки:

- `Очистить даты запрета`. Перед проведением документов будут очищены даты запрета. Если настройка выключена обработка будет брать максимальную дату запрета и по ней отбирать документы для проведения
- `Формирование данных для отчета Allure`. Формировать отчет в формате Allure по результатам выполнения тестов. На данный момент выгружаются только ошибки

 <img src="https://raw.githubusercontent.com/leobrn/ones-smoke-allure/main/examples/group-check-settings.png" alt="Настройки" style="zoom:80%;" />

Отчет `Allure`

 <img src="https://raw.githubusercontent.com/leobrn/ones-smoke-allure/main/examples/group-check-allure1.png" alt="Allure" style="zoom:80%;" />

  <img src="https://raw.githubusercontent.com/leobrn/ones-smoke-allure/main/examples/group-check-allure2.png" alt="Allure" style="zoom:80%;" />

## Дымовые тесты

<a id="markdown-синтаксическая-проверка" name="#синтаксическая-проверка"></a>

- <a href="https://github.com/vanessa-opensource/add/tree/develop/tests/smoke" target="_blank">Официальная документация по дымовым тестам</a>

Если нужна авторизация в клиенте тестирования, добавьте в `xunit` ключ `--testclient`. Если версия `Vanessa-ADD` меньше `6.7.0`, замените плагины в библиотеке `C:\Program Files\OneScript\lib\add\plugins` на плагины из папки `plugins`.

```json
{
  "xunit": {
    "testsPath": "./tests",
    "--xddConfig": "./tools/JSON/settingsSmoke.json",
    "--reportsxunit": "ГенераторОтчетаAllureXMLВерсия2{allure/smoke/allure.xml}",
    "--xddExitCodePath": "./build/xddExitCodePath.txt",
    "--testclient": "Администратор:123456:1538"
  }
}
```

Если нужно подключаться к серверной базе, измените в `default` ключ `ibconnection`

```json
{
  "default": {
    "--ibconnection": "/Sservername\\basename"
  }
}
```
## Информация о поддержке метаданных

С помощью <a href="https://github.com/vanessa-opensource/vanessa-support" target="_blank">vanessa-support</a> можно получить готовый json-файл для всех метаданных, которые могут быть изменены и не находятся в режиме чтения. Полученный файл можно использовать для групповой проверки доработок.

```json
{
 "Справочники": [
  "ВидыНоменклатуры",
  "Организации"
 ],
 "ПланыВидовХарактеристик": [
  "СтатьиДоходов",
  "СтатьиРасходов"
 ],
 "Документы": [
  "АвансовыйОтчет",
  "АктВыполненныхРабот"
 ],
 "Отчеты": [
    "ABCXYZАнализНоменклатуры"
   ]
}
```
1) Укажите данные для подключения к ИБ в файле `env.json`
2) Выполните команду `decompileCf.cmd`
3) Выполните команду `getSupportObjects.cmd`
4) Файл с результатом `tools\json\supportObjects.json`

## Синтаксическая проверка

Кроме дымовых тестов, включена синтаксическая проверка расширений.

- <a href="https://github.com/vanessa-opensource/vanessa-runner#%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-%D1%81%D0%B8%D0%BD%D1%82%D0%B0%D0%BA%D1%81%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B9-%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B8" target="_blank">Настройка синтаксической проверки</a>

Если используется хранилище, добавьте в `syntax-check` ключи: `--storage-name`, `--storage-user`, `--storage-pwd`.

Если нужно пропустить некоторые ошибки, укажите их в файле `tools/syntax_check_exception.txt`. Можно указать часть текста ошибки `Возможно ошибочное свойство:`.

```json
    "syntax-check": {
        "--allure-results2": "allure/syntax-check",
        "--groupbymetadata": true,
        "--exception-file": "./tools/syntax_check_exception.txt",
        "--storage-name": "D:\\Store",
        "--storage-user": "admin",
        "--storage-pwd": "123",
        "--mode": [
            "-ExtendedModulesCheck",
            "-ThinClient",
            "-WebClient",
            "-Server",
            "-AllExtensions"
        ]
    }
```

<a id="markdown-проверка-кода" name="#проверка-кода"></a>

## Проверка кода

<a id="markdown-доп-материалы" name="#доп-материалы"></a>

Для быстрой проверки кода можете использовть простой инструмент <a href="https://github.com/otymko/phoenixbsl" target="_blank">Phoenix BSL</a>.

В каталоге `tools/json` расположен файл с настройками `settingsBSL.json`.

- <a href="https://1c-syntax.github.io/bsl-language-server/en/features/ConfigurationFile/" target="_blank">Возможные настройки</a>

- <a href="https://1c-syntax.github.io/bsl-language-server/en/diagnostics/" target="_blank">Диагностики</a>

## Дополнительные материалы

- <a href="https://youtube.com/playlist?list=PLB1FqRhexVy65PCet9YFZ9uHAh6hu2C24" target="_blank">Юнит - тестирование и управление качеством кода в 1С</a>
