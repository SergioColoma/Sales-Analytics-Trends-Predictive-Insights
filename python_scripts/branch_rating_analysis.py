# -*- coding: utf-8 -*-
"""Project.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/178B3yrXARgEHwp0g868ls4RmZO5n8j8H
"""

import pandas as pd
import matplotlib.pyplot as plt

# Load the CSV file
df = pd.read_csv('/content/Project/average_branch_rating.csv')
df

# basic info and statistics
print(df.info())
print(df.describe())

# group and calculate the average rating
average_ratings = df.groupby("Branch")["Average_Rating"].mean()

# bar chart
plt.figure(figsize=(8, 5))
average_ratings.plot(kind="bar", color=["blue", "green", "red"])
plt.title("Average Rating by Branch")
plt.xlabel("Branch")
plt.ylabel("Average Rating")
plt.xticks(rotation=0)
plt.grid(axis="y", linestyle="--", alpha=0.7)
plt.show()

