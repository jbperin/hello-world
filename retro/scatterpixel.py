import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def display_rgb_scatter(image_path):
    # Charger l'image
    image = Image.open(image_path)
    image = image.convert('RGB')  # S'assurer que l'image est en mode RGB

    # Extraire les pixels sous forme de tableau numpy
    pixels = np.array(image)
    pixels = pixels.reshape(-1, 3)  # Aplatir en une liste de pixels (R, G, B)

    # Obtenir les composantes R, G, B
    r = pixels[:, 0]
    g = pixels[:, 1]
    b = pixels[:, 2]

    # Création du nuage de points en 3D
    fig = plt.figure(figsize=(10, 8))
    ax = fig.add_subplot(111, projection='3d')

    # Ajouter les points
    ax.scatter(r, g, b, c=pixels / 255.0, marker='o', s=1)

    # Configurer les axes
    ax.set_xlabel('Rouge')
    ax.set_ylabel('Vert')
    ax.set_zlabel('Bleu')
    ax.set_title('Nuage de points des pixels en RGB')

    plt.show()

# Remplacer 'chemin_vers_image.jpg' par le chemin de votre image
# display_rgb_scatter('C:\\Users\\tbpk7658\\Documents\\repos\\wolfric\\assets\\sprites02_tiles\\tile_1_0.png')
#display_rgb_scatter('C:\\Users\\tbpk7658\\Documents\\repos\\wolfric\\assets\\textures\\barrel.png')
# display_rgb_scatter('C:\\Users\\tbpk7658\\Documents\\repos\\wolfric\\assets\\sprites01_tiles\\tile_7_2.png')
# display_rgb_scatter('C:\\Users\\tbpk7658\\Documents\\repos\\wolfric\\assets\\barrel_post.bmp')
# display_rgb_scatter('C:\\Users\\tbpk7658\\Documents\\repos\\wolfric\\assets\\spritesNtextures_tiles\\tile_2_0.png')
display_rgb_scatter('C:\\Users\\tbpk7658\\Documents\\repos\\castoric\\img\\tile_13_6.png')
#display_rgb_scatter('C:\\Users\\tbpk7658\\Documents\\repos\\wolfric\\assets\\')
