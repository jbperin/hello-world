# MqttSequencer



# Principe général



## Lecture d'un fichier CSV

```python3
import csv

def litCSV(filepath):
    with open(filepath, newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=';', quotechar='"')
        for row in spamreader:
            print (row) #(', '.join(row))

if __name__ == '__main__':

    FILEPATH = "PathToFile.csv"
    litCSV(FILEPATH)

```

## Conversion format de dates

```python3
date_time_str = "15/06/2018  11:27:17"
date_time_obj = datetime.datetime.strptime(date_time_str, '%d/%m/%Y  %H:%M:%S')
dtformated = date_time_obj.strftime("%Y-%m-%dT%H:%M:%S")
```

## Réalisation d'action programmées

Le code suivant réalise un affichage au bout de 2 et 3 secondes.

```python3
import sched, time

def publish (data):
    print ("%s: %s"%(time.time(), data))

if __name__ == '__main__':
    s=sched.scheduler(time.time, time.sleep)
    s.enter(2, 1, publish, argument=('au bout de 2 secondes',))
    s.enter(3, 1, publish, argument=('au bout de 3 secondes',))
    s.run()
```

L'appel à `sched.scheduler.enter` prend les paramètres suivants:
* le nombre de secondes avant de réaliser l'action,
* la priorité de l'action (pour les cas où plusieurs évènements sont programmés au même instant)
* la fonction à appeler
* les paramètres de la fonction qui peuvent être:
  * soit positionnel (ex : `argument=('value1','value2,')`)
  * soit sous forme de dictionnaire (ex : `kwargs={'param1': 'value1'}`)
