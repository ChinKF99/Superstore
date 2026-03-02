import pandas as pd

df = pd.read_csv('superstore.csv', encoding='latin1')

# Replace "," with empty string
df.product_name = df.product_name.str.replace(',', '', regex=False)

output_filename = 'modified_superstore.csv'
df.to_csv(output_filename, index=False)




