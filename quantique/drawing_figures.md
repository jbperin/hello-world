
Les tracés géométriques avec Matplotlib reposent principalement sur :

* `plot()` pour segments et polylignes
* `scatter()` pour points
* `patches` pour formes (cercle, rectangle, polygone…)
* contrôle du repère (`axis('equal')`) pour respecter la géométrie

Voici les cas fondamentaux.

---

# 1️⃣ Segment de droite

```python
import matplotlib.pyplot as plt

fig, ax = plt.subplots()

ax.plot([0, 3], [0, 2])   # segment entre (0,0) et (3,2)

ax.set_aspect('equal')
ax.grid(True)
plt.show()
```

👉 `set_aspect('equal')` est essentiel pour éviter la déformation.

---

# 2️⃣ Points géométriques

```python
ax.scatter([1,2,3], [2,1,3])
```

Ajouter annotations :

```python
ax.annotate("A", (1,2))
```

---

# 3️⃣ Cercle

On utilise `patches`.

```python
import matplotlib.patches as patches

fig, ax = plt.subplots()

circle = patches.Circle((0, 0), radius=2, fill=False)
ax.add_patch(circle)

ax.set_xlim(-3,3)
ax.set_ylim(-3,3)
ax.set_aspect('equal')
plt.grid(True)
plt.show()
```

---

# 4️⃣ Rectangle

```python
rect = patches.Rectangle((0,0), 4, 2, fill=False)
ax.add_patch(rect)
```

---

# 5️⃣ Polygone

```python
polygon = patches.Polygon([[0,0],[2,1],[1,3]], fill=False)
ax.add_patch(polygon)
```

---

# 6️⃣ Triangle avec médiatrices (exemple géométrie plane)

```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches

A = np.array([0,0])
B = np.array([4,0])
C = np.array([2,3])

fig, ax = plt.subplots()

# Triangle
ax.plot([A[0],B[0],C[0],A[0]],
        [A[1],B[1],C[1],A[1]])

# Points
ax.scatter(*A)
ax.scatter(*B)
ax.scatter(*C)

ax.annotate("A", A)
ax.annotate("B", B)
ax.annotate("C", C)

ax.set_aspect('equal')
ax.grid(True)
plt.show()
```

---

# 7️⃣ Cercle paramétrique (méthode analytique)

Approche utile en géométrie analytique :

```python
theta = np.linspace(0, 2*np.pi, 400)
x = 2*np.cos(theta)
y = 2*np.sin(theta)

ax.plot(x, y)
```

---

# 8️⃣ Droite définie par équation ax + by + c = 0

```python
x = np.linspace(-5,5,200)
a, b, c = 1, -1, 0

y = (-a*x - c)/b
ax.plot(x, y)
```

---

# 9️⃣ Vecteurs (géométrie vectorielle)

```python
ax.quiver(0,0, 3,2, angles='xy', scale_units='xy', scale=1)
```

---

# 🔟 Transformation géométrique (rotation)

```python
theta = np.pi/4
R = np.array([[np.cos(theta), -np.sin(theta)],
              [np.sin(theta),  np.cos(theta)]])

square = np.array([[0,0],[1,0],[1,1],[0,1],[0,0]])
rot_square = square @ R.T

ax.plot(square[:,0], square[:,1])
ax.plot(rot_square[:,0], rot_square[:,1])
```

---

# ⚙️ Bonnes pratiques géométriques

Toujours :

```python
ax.set_aspect('equal')
ax.set_xlim(...)
ax.set_ylim(...)
ax.grid(True)
```

Sinon les figures sont déformées.

---

# 🧠 Résumé structurel

| Objet géométrique   | Outil               |
| ------------------- | ------------------- |
| Segment             | `plot()`            |
| Points              | `scatter()`         |
| Cercle              | `patches.Circle`    |
| Rectangle           | `patches.Rectangle` |
| Polygone            | `patches.Polygon`   |
| Vecteur             | `quiver()`          |
| Courbe paramétrique | `plot()`            |

---


Une animation géométrique avec Matplotlib repose sur `matplotlib.animation.FuncAnimation`.

Dans JupyterLab, il faut aussi gérer correctement l’affichage (HTML5).

Je te donne d’abord le **schéma conceptuel**, puis des exemples propres.

---

# 🔧 Principe général

1. Créer la figure et les objets graphiques
2. Définir une fonction `update(frame)`
3. Utiliser `FuncAnimation`
4. Afficher en HTML

Structure minimale :

```python
from matplotlib.animation import FuncAnimation
```

---

# 1️⃣ Animation simple : point tournant sur un cercle

## Objectif

Visualiser un mouvement circulaire uniforme.

```python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from IPython.display import HTML

fig, ax = plt.subplots()
ax.set_aspect('equal')
ax.set_xlim(-1.5, 1.5)
ax.set_ylim(-1.5, 1.5)
ax.grid(True)

# Cercle fixe
theta = np.linspace(0, 2*np.pi, 400)
ax.plot(np.cos(theta), np.sin(theta))

# Point mobile
point, = ax.plot([], [], 'o')

def update(frame):
    x = np.cos(frame)
    y = np.sin(frame)
    point.set_data([x], [y])
    return point,

ani = FuncAnimation(fig, update,
                    frames=np.linspace(0, 2*np.pi, 200),
                    interval=30)

HTML(ani.to_jshtml())
```

---

# 2️⃣ Animation géométrie vectorielle (vecteur tournant)

```python
fig, ax = plt.subplots()
ax.set_aspect('equal')
ax.set_xlim(-2,2)
ax.set_ylim(-2,2)
ax.grid(True)

vector = ax.quiver(0,0,1,0, angles='xy', scale_units='xy', scale=1)

def update(frame):
    vector.set_UVC(np.cos(frame), np.sin(frame))
    return vector,

ani = FuncAnimation(fig, update,
                    frames=np.linspace(0, 2*np.pi, 200),
                    interval=30)

HTML(ani.to_jshtml())
```

---

# 3️⃣ Rotation d’un polygone (transformation affine)

```python
fig, ax = plt.subplots()
ax.set_aspect('equal')
ax.set_xlim(-2,2)
ax.set_ylim(-2,2)
ax.grid(True)

square = np.array([[0,0],[1,0],[1,1],[0,1],[0,0]])
line, = ax.plot([], [])

def update(frame):
    theta = frame
    R = np.array([[np.cos(theta), -np.sin(theta)],
                  [np.sin(theta),  np.cos(theta)]])
    rot = square @ R.T
    line.set_data(rot[:,0], rot[:,1])
    return line,

ani = FuncAnimation(fig, update,
                    frames=np.linspace(0, 2*np.pi, 200),
                    interval=30)

HTML(ani.to_jshtml())
```

---

# 4️⃣ Exemple intéressant : cercle roulant (épicycloïde simple)

Animation géométriquement plus riche :

```python
fig, ax = plt.subplots()
ax.set_aspect('equal')
ax.set_xlim(-3,3)
ax.set_ylim(-3,3)
ax.grid(True)

R = 1
r = 0.5

circle_big, = ax.plot([], [])
circle_small, = ax.plot([], [])
point, = ax.plot([], [], 'o')

theta_vals = np.linspace(0, 2*np.pi, 400)

def update(frame):
    t = frame
    
    # grand cercle
    circle_big.set_data(R*np.cos(theta_vals),
                        R*np.sin(theta_vals))
    
    # centre du petit cercle
    cx = (R-r)*np.cos(t)
    cy = (R-r)*np.sin(t)
    
    circle_small.set_data(cx + r*np.cos(theta_vals),
                          cy + r*np.sin(theta_vals))
    
    # point sur petit cercle
    px = cx + r*np.cos((R-r)/r*t)
    py = cy - r*np.sin((R-r)/r*t)
    point.set_data([px], [py])
    
    return circle_big, circle_small, point

ani = FuncAnimation(fig, update,
                    frames=np.linspace(0, 10, 300),
                    interval=30)

HTML(ani.to_jshtml())
```

---

# ⚙️ Bonnes pratiques importantes

### 1️⃣ Toujours fixer :

```python
ax.set_aspect('equal')
```

### 2️⃣ Fixer les limites

Sinon la figure "saute".

### 3️⃣ Retourner les artistes modifiés

Sinon animation instable.

---

# 🎯 Export en vidéo

Si tu veux exporter :

```python
ani.save("animation.mp4", dpi=200)
```

(FFmpeg doit être installé)

---

# 🧠 Résumé technique

| Élément            | Rôle                    |
| ------------------ | ----------------------- |
| `FuncAnimation`    | moteur d’animation      |
| `update()`         | évolution temporelle    |
| `set_data()`       | mise à jour coordonnées |
| `quiver.set_UVC()` | mise à jour vecteur     |
| `to_jshtml()`      | affichage Jupyter       |

---


