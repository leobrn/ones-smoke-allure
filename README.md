# Дымовые тесты для 1С и вывод результата в отчет Allure

Сборка создана для инструмента <a href="https://github.com/vanessa-opensource/add" target="_blank">Vanessa-ADD</a>.

Доработан инструмент по управлению дымовыми тестами, изменен ряд тестов. <a href="https://youtu.be/NzB2dIhH08s" target="_blank">Демонстрация</a>

[![telegram](https://img.shields.io/badge/telegram-chat-green.svg)](http://t.me/ovmst)

- [Цель](#цель)
- [Проблема](#проблема)
- [Задача](#задача)
- [Установка](#установка)
  - [Создание проекта](#создание-проекта)
- [Управление дымовыми тестами](#управление-дымовыми-тестами)
- [Дымовые тесты](#дымовые-тесты)
  - [Открытие/закрытие форм объектов метаданных](#открытие-форм)
  - [Командный интерфейс](#командный-интерфейс)
  - [Проведение документов](#проведение-документов)
  - [Проверка макетов СКД](#проверка-макетов-скд)
  - [Формирование печатных форм](#формирование-печатных-форм)
- [Синтаксическая проверка](#синтаксическая-проверка)
- [Описание команд](#описание-команд)
- [Проверка кода](#проверка-кода)
- [Дополнительные материалы](#доп-материалы)

<a id="markdown-цель" name="#цель"></a>

## Цель

Точечная настройка дымовых тестов. Возможность отобрать объекты для проверки, которые доработаны в расширениях. Сократить время тестирования доработок за счет точечной настройки дымовых тестов.

<a id="markdown-проблема" name="#проблема"></a>

## Проблема

В Vanessa-ADD нет возможности автоматический отобрать объекты, доработанные в расширении для тестирования. Нужно руками помечать ненужные объекты в исключения.

Представим. Есть среднестатистический 1С франчайзи с проектным отделом. В котором есть 4 консультанта и 4 программиста. Есть небольшие проекты и ряд небольших клиентов на постоянной поддержке.

На таких проектах как правило делают небольшие доработки в расширение плюс внешние обработки и печатные формы.

Как правило это происходит в самом начале, когда заходит клиент, и далее с ними работает консультант. В такой схеме консультант обновляет базы клиента. После обновления ему нужно протестировать доработки вручную и в случае проблемы с расширением привлекать программиста.

<a id="markdown-задача" name="#задача"></a>

## Задача

Автоматизировать процесс проверки сделанных доработок. Сократить время на настройку и выполнения тестов за счет точечной настройки. Результаты тестирования вывести в отчет Allure.

<a id="markdown-установка" name="#установка"></a>

## Установка

- <a href="https://github.com/leobrn/ones-smoke-allure/blob/main/doc/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D1%8F%20%D0%BF%D0%BE%20%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B5%20%D0%B4%D0%BB%D1%8F%20%D0%B0%D0%B4%D0%BC%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D1%80%D0%B0%D1%82%D0%BE%D1%80%D0%BE%D0%B2.txt" target="_blank">Инструкция по установке</a>
- <a href="https://github.com/vanessa-opensource/vanessa-runner/blob/develop/README.md" target="_blank">Настройка vanessa runner (файл .env)</a>

Предусмотрен запуск Allure в Docker

<a id="управление-дымовыми-тестами" name="#управление-дымовыми-тестами"></a>

### Создание проекта

<a id="markdown-создание-проекта" name="#создание-проекта"></a>

С версии `1.11.0` <a href="https://github.com/vanessa-opensource/vanessa-runner" target="_blank">vanessa-runner</a> доступна команда `init-project`.

С ее помощью можно быстро развернуть проект с помощью следующих команд:

- `vrunner init-project --template https://github.com/leobrn/ones-smoke-allure.git` 
- `vrunner init-project --settings my-path/env.json`

При создании проекта сразу будут собраны обработки.

## Управление дымовыми тестами

<a id="markdown-дымовые-тесты" name="#дымовые-тесты"></a>

Добавлена команда `Исключить объекты, не используемые в расширение`.

Доступны 4 вкладки:

- `Открытие форм` - без изменений
- `Проведение и печатные формы` - добавленная. Задается количество документов для проведения, количество документов для проверки печатных форм. Добавляются в исключения нужные документы, отдельно для проведения и печатных форм
- `Макеты СКД` - добавленная. Можно добавить в исключения общий макет или объект, макеты которого не будут проверяться
- `Доп. настройки` - добавленная
  - `Закрывать модальные окна` - <a href="https://github.com/vanessa-opensource/add/tree/develop/tests/smoke#%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D0%B8-%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F-%D0%BC%D0%BE%D0%B4%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%BC%D0%B8-%D0%BE%D0%BA%D0%BD%D0%B0%D0%BC%D0%B8" target="_blank">официальное описание</a>. В файл добавляется настройка из примера в описание
  - `Тестирование командного интерфейса` - включить использование тестов командного интерфейса. В исключения по объектам попадают объекты, указанные на вкладке `Открытие форм` в группах `Существующие`

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

### Открытие/закрытие форм объектов метаданных

<a id="markdown-открытие-форм" name="#открытие-форм"></a>

- <a href="https://github.com/vanessa-opensource/add/tree/develop/tests/smoke#%D0%B4%D1%8B%D0%BC%D0%BE%D0%B2%D1%8B%D0%B5-%D1%82%D0%B5%D1%81%D1%82%D1%8B-%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D1%8F%D0%B7%D0%B0%D0%BA%D1%80%D1%8B%D1%82%D0%B8%D1%8F-%D1%84%D0%BE%D1%80%D0%BC-%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D0%BE%D0%B2-%D0%BC%D0%B5%D1%82%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85-%D0%B8-%D0%B8%D0%B7%D0%BC%D0%B5%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F-%D0%BC%D0%B5%D1%82%D0%B0%D0%B4%D0%B0%D0%BD%D0%BD%D1%8B%D1%85" target="_blank">официальное описание</a>

### Командный интерфейс

<a id="markdown-командный-интерфейс" name="#командный-интерфейс"></a>

- <a href="https://github.com/vanessa-opensource/add/tree/develop/tests/smoke#%D0%B4%D1%8B%D0%BC%D0%BE%D0%B2%D1%8B%D0%B5-%D1%82%D0%B5%D1%81%D1%82%D1%8B-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%BD%D0%BE%D0%B3%D0%BE-%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81%D0%B0" target="_blank">официальное описание</a>

### Проведение документов

<a id="markdown-проведение-документов" name="#проведение-документов"></a>

- <a href="https://github.com/vanessa-opensource/add/tree/develop/tests/smoke#%D1%82%D0%B5%D1%81%D1%82%D1%8B-%D0%BF%D1%80%D0%BE%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D1%8F-%D0%B4%D0%BE%D0%BA%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2" target="_blank">официальное описание</a>

Доработано:

- Объекты, которые находятся в исключениях, не выводятся в дерево тестов
- Адаптирован под новый формат тестов

### Проверка макетов СКД

<a id="markdown-проверка-макетов-скд" name="#проверка-макетов-скд"></a>

- <a href="https://github.com/vanessa-opensource/add/tree/develop/tests/smoke#%D1%82%D0%B5%D1%81%D1%82%D1%8B-%D0%BC%D0%B0%D0%BA%D0%B5%D1%82%D0%BE%D0%B2-%D1%81%D0%BA%D0%B4" target="_blank">официальное описание</a>

Доработано:

- Объекты, которые находятся в исключениях, не выводятся в дерево тестов
- Идентификация ошибок

### Формирование печатных форм

<a id="markdown-формирование-печатных-форм" name="#формирование-печатных-форм"></a>

- <a href="https://github.com/vanessa-opensource/add/tree/develop/tests/smoke#%D1%82%D0%B5%D1%81%D1%82%D1%8B-%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D0%BD%D1%8B%D1%85-%D1%84%D0%BE%D1%80%D0%BC-%D0%B4%D0%BB%D1%8F-%D0%B1%D1%81%D0%BF-%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D0%B9" target="_blank">официальное описание</a>

Доработано:

- Объекты, которые находятся в исключениях, не выводятся в дерево тестов

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

<a id="markdown-описание-команд" name="#описание-команд"></a>

## Описание команд

- `installVA.cmd` - обновление пакетов onescript, установка vanessa-runner и vanessa-add
- `replaceVA.cmd` - собирает обработки из исходников и делает замену обработок xddTestRunner.epf (из ветки develop), УправлениеДымовымиТестами и плагинов (из ветки develop) в корне библиотеки vanessa-add
- `runSyntax.cmd` - запуск синтаксической проверки
- `runSmoke.cmd` - запуск дымовых тестов
- `runAllure.cmd` - формирование отчета Allure. Предусмотрено сохранение истории
- `runTests.cmd` - запуск трех команд: runSyntax, runSmoke, runAllure

<a id="markdown-проверка-кода" name="#проверка-кода"></a>

## Проверка кода

<a id="markdown-доп-материалы" name="#доп-материалы"></a>

Для быстрой проверки кода можете использовть простой инструмент <a href="https://github.com/otymko/phoenixbsl" target="_blank">Phoenix BSL</a>.

В каталоге `tools/json` расположен файл с настройками `settingsBSL.json`.

- <a href="https://1c-syntax.github.io/bsl-language-server/en/features/ConfigurationFile/" target="_blank">Возможные настройки</a>

- <a href="https://1c-syntax.github.io/bsl-language-server/en/diagnostics/" target="_blank">Диагностики</a>

## Дополнительные материалы

- <a href="https://youtube.com/playlist?list=PLB1FqRhexVy65PCet9YFZ9uHAh6hu2C24" target="_blank">Юнит - тестирование и управление качеством кода в 1С</a>
