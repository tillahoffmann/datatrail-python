This simple notebook illustrates how the final figure of the DataTrail chapter on [Good Plots](https://datatrail-jhu.github.io/DataTrail/good-plots.html) could be reproduced in Python. Here, we only seek to ascertain whether the workflow, environment, and runtime are appropriate for DataTrail.

```python
import pandas as pd
from matplotlib import pyplot as plt
```

```python
# Load the data and extract the date from year and quarter.
data = pd.read_csv("apple_sales.csv")
data["date"] = pd.PeriodIndex(year=data.pop("year"), quarter=data.pop("quarter")).to_timestamp()
data = data.set_index("date")
```

```python
# Plot the data and annotations.
fig, ax = plt.subplots()
for product, sales in data.items():
    # Drop missing values and plot the series.
    sales = sales.dropna()
    color = "C3" if product == "iPhone" else "C7"
    ax.plot(sales.index, sales, color=color)
    # Add the product label annotation for the last available value.
    date = sales.index[-1]
    value = sales.iloc[-1]
    ax.text(date + pd.Timedelta(weeks=8), value, product, va="center")
    
# Adjust the bounds so the labels fit.
ax.set_xlim(right=data.index.max() + pd.Timedelta(weeks=78))
    
# Add axes labels and title.
ax.set_title("iPhone more successful than all other Apple products")
ax.set_ylabel("worldwide quarterly sales of selected\nApple products in millions")
ax.set_xlabel("date")
fig.tight_layout()
```
