import pandas as pd

df = pd.read_csv('supermarket.csv')

# Total number of Baskets
baskets = df.groupby(['Customer Id', 'Date'])

# Support of Products
items = df['Product'].value_counts()
supports = {item:count/len(baskets) for item, count in zip(items.keys(), items)}


# Part 6
print(','.join(list(supports)[:5]))