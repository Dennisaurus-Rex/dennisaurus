# dennisaurus.dev

## Library Hirarchy

A lower level library is a library that is used by a higher level library. A lower level library is __not__ allowed to use a higher level library.

This is to:

1. prevent circular dependencies
2. "force" dependency injection
3. have a clean one way reactive MVVM architecture

### List of libraries

| Level | Library | Description | Example files/components |
|-------|---------|-------------|----------------|
| 0     | debug   | Debugging tools | `debug.dart` |
| 1     | core    | Core utilities  | extensions on pre existing components |
| 2     | models  | Data models | `user.dart` |
| 3     | networking | Networking | repositories |
| 4     | logic   | Business logic | viewmodels |
| 5     | ui      | User interface | widgets |
| 6     | main.dart | Main entry point | only `main.dart` |
