# posts_reader

This is a simple post reader application example using JSONPLACEHOLDER as data source and flutter as main technology.

Into the aplication we are able to check the a list of post, check their details, add them as favorites and remove the ones that are not relevant to us.

For the development of the project i used a Clean architecture adaptation to flutter and Provider as state management solution (Personally i'm a big fan of BloC as core solution but for small project it can be excessive).

The external packages used for the application are: 

Http -> To make easy http request and fetch data from the web.\
Path -> To make String based cross-platform path manipulation.\
Provider -> To make easier the state managemente solucion.\
Sqflite -> To use lightwieigh sqlDB as local persistence solution.

For future iterations:

Mockito -> To ensure agile tests.\
GetIt -> To implement dependencies injection.\

With the following steps the project will be ready to go:

Clone the repository:
https://github.com/Ryss-D/posts_reader.git

Intall the dependencies:
Flutter pub get

Run on the emulator of your preference:
Flutter pub run

The app its ready to go!

