```sequence
Andrew->China: Says Hello
```

```dot
digraph G {
  A->B
  B->C
  B->D
}
```

```flow
st=>start:
e=>end
```

```sequence {theme="hand"}
Andrew->China: Says Hello
```

```mermaid
graph LR
  A-->B;
  B-->C;
  C-->A;
```


```ditaa {cmd=true args=["-E"]}
+----------------+            +-------------------+
|                |            |                   |
|                |            |                   |
|      process A +----------->+   Process B       |
|                |            |                   |
|                |            |                   |
+------+---------+            +-----------+-------+
       |                                  ^
       |                                  |
       |                                  |
       |                                  |
       |        Retro action              |
       +----------------------------------+
```


```puml
@startuml

(First usecase)
(Another usecase) as (UC2)  
usecase UC3
usecase (Last\nusecase) as UC4

@enduml
```
