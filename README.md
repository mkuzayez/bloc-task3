
# ---BloC--- 

BloC helps developers to seperate logic from the UI.
BloC pattern comprises of a bloC class that emits States in response to triggered Events.


What is a "Stream": A stream is a sequence of asynchronous data, transformed from the UI/Frontend to Backend and vice versa.
Think of it as a pipe with water flowing through it. The pipe is the stream and the water is the data.


What is a "Cubit": Cubit is a simpler form of BloC (and very similar to the concept of Provider in Riverpod)


Cubit vs. BloC:
The main difference is how each one of them recieves input from the UI. 
BloC handles a [stream of] events, while Cubits specialized for handling a pre-defined functions.


Therefore, Cubit is used for simple State management where you just have one kind of event to bind to the state.
BloC is used for complex state management where you can have many events to map to states.


By default events are processed concurrently, which means that if we add two events at the same time, all of them will be processed at the same time concurrently.
If you want to change this check out bloc_concurrency package.


BloC&Cubits main Concepts/Features: 

- BlocProvider(): It provides a single instance of BloC to the whole subtree below it (this process also know as "Dependency Injection"
which is a programming technique in which an object or function receives other objects or functions that it requires).

  In order to make BloC/Cubit available throughout the whole widget tree, we must wrap the widget tree with a BlocProvider().

  Syntax wise - e.g.:
  
      BlocProvider<ExampleCupit>(
        create: (context) => ExampleCubit(),   
        child: MaterialApp(home: YourWidget(),
          )
      );



- BlocBuilder(): A widgets that triggers a rebuild to the UI when the State changes.
    
  It's way more efficent to only wrap the very specifec widget you want to rebuild within BlocBuilder().
  
  Syntax wise - e.g.:
  
      BlocBuilder<BlocA, BlocAState>{
  	    builder: (context, state) {
  	    // return a widget here based on BlocA's State.
  	    }
      }
      
  The builder function must be a pure function (it means that it's only depends on its arguments, not on any other state or data from outside),
  
  so in our case, the builder function must only depends on context and state.
  
  
  If [bloc] is ommited, and it should be in most cases (more on that in the following line), then it will be searched for by BlocProvider in the widget tree.
  
  Only specify the [bloc] if you wish to provide a [bloc] that is otherwise not accessible via [BlocProvider] and the current [BuildContext].
  
  
  [builder] can be called many times due to how Flutter engine works, which make it not ideal for navigation, showing a snackbar, and so on.
  
  
  
  
- BlocListener(): Simmilar to BlocBuilder(), Listens to State changes, and instead of rebuilding a widgets, It calls the given callback function every time State changes.
    
  Syntax wise - e.g.:

  
        BlocListener<BlocA, BlocAState>{
    
      	  listener: (context, state) {
      	  // do stuff here every time the State changes.
      	  }
        }

    Only specify the [bloc] if you wish to provide a [bloc] that is otherwise not accessible via [BlocProvider] and the current [BuildContext].
  

- BlocConsumer(): Combines both of BlocBuilder() and BlocListener() into a single widget.
  
  Syntax wise - e.g.:

      BlocConsumer<BlocA, BlocAState>{
      	listener: (context, state) {
      	// do stuff here every time the State changes.
      	}
      	builder: (context, state) {
      	// return a widget here based on BlocA's State.
      	}
          }

