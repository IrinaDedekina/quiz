### Викторина
#### Описание

Программа, написанная на языке Ruby.

#### Запуск программы
1. Необходимо склонировать репозиторий командой:
``` 
git clone https://github.com/IrinaDedekina/quiz.git
```
2. Перейти в папку проекта
3. Чтобы начать играть необходимо в терминале набрать команду:
```
ruby main.rb
```

#### Изменить\добавить вопросы
Для того, чтобы изменить или добавить вопросы в игру необходимо перейти в файл `data/questions.xml`
Данные вносят в формате:
```
<question seconds="5" points="3">
    <text>Вопрос</text>
    <variants>
      <variant>1-й вариант ответа</variant>
      <variant>2-й вариант ответа</variant>
      <variant right="true">3-й вариант ответа (верный) </variant>
      <variant>4-й вариант ответа</variant>
    </variants>
  </question>
```
