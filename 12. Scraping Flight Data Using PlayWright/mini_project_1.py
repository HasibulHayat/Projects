# -*- coding: utf-8 -*-
"""Mini_Project_1.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1zGfFEZ9KxeTtAbwB7Gy_CGpvPooOIKjF
"""

!pip install pytest-playwright
!playwright install
!pip install nest_asyncio
!playwright install-deps

import nest_asyncio
import os
import pandas as pd
import asyncio
from playwright.async_api import async_playwright

nest_asyncio.apply()

async def main(url):

    rows_list = []

    async with async_playwright() as p:
        browser = await p.firefox.launch(
            headless=True
        )
        page = await browser.new_page()
        await page.goto(url)
        await asyncio.sleep(10)
        await page.screenshot(path="momondo.png", full_page=True)

        for row in await page.locator('.nrc6').all():
            price = await row.locator('.f8F1-price-text').text_content()
            time = await row.locator('.vmXl.vmXl-mod-variant-large').text_content()
            airlines = await row.locator(".VY2U").locator('.c_cgF.c_cgF-mod-variant-default').text_content()
            stops = await row.locator('.JWEO-stops-text').text_content()
            duration = await row.locator('.xdW8').text_content()

            rows_list.append({
                'Price': price,
                'Time': time,
                'Airlines': airlines,
                'Stops': stops,
                'Duration': duration
            })

        await browser.close()

    flight_data = pd.DataFrame(rows_list)

    return flight_data

flight_data_cheapest = asyncio.run(main("https://www.momondo.com/flight-search/HEL-NYC/2023-10-10?sort=price_a"))

flight_data_best = asyncio.run(main("https://www.momondo.com/flight-search/HEL-NYC/2023-10-10?sort=bestflight_a"))

flight_data_quickest = asyncio.run(main("https://www.momondo.com/flight-search/HEL-NYC/2023-10-10?sort=duration_a"))

flight_data_earliest = asyncio.run(main("https://www.momondo.com/flight-search/HEL-NYC/2023-10-10?sort=arrive_a"))

flight_data_latest = asyncio.run(main("https://www.momondo.com/flight-search/HEL-NYC/2023-10-10?sort=depart_b"))

final_flight_data = pd.concat([flight_data_cheapest, flight_data_best, flight_data_quickest, flight_data_earliest, flight_data_latest], ignore_index=True)

final_flight_data

final_flight_data.to_csv('final_flight_data.csv', index=False)

flights = pd.read_excel("flights.xlsx")

flights

import matplotlib.pyplot as plt

# Set up the figure and axes for the subplots
fig, axes = plt.subplots(2, 2, figsize=(10, 7))

# Plot 1: Price Distribution
axes[0, 0].hist(flights['Price'], bins=10, color='blue', alpha=0.7, edgecolor='black')
axes[0, 0].set_title('Price Distribution')
axes[0, 0].set_xlabel('Price')
axes[0, 0].set_ylabel('Frequency')

# Plot 2: Duration Hour Distribution
axes[0, 1].hist(flights['DurationHour'], bins=10, color='green', alpha=0.7, edgecolor='black')
axes[0, 1].set_title('Duration Hour Distribution')
axes[0, 1].set_xlabel('Duration (Hours)')
axes[0, 1].set_ylabel('Frequency')

# Plot 3: Airlines vs. Average Price
avg_price_per_airline = flights.groupby('Airlines')['Price'].mean().sort_values()
axes[1, 0].barh(avg_price_per_airline.index, avg_price_per_airline.values, color='purple', alpha=0.7)
axes[1, 0].set_title('Airlines vs. Average Price')
axes[1, 0].set_xlabel('Average Price')
axes[1, 0].set_ylabel('Airlines')

# Plot 4: Stops vs. Average Price
avg_price_per_stop = flights.groupby('Stops')['Price'].mean().sort_values()
axes[1, 1].bar(avg_price_per_stop.index, avg_price_per_stop.values, color='orange', alpha=0.7)
axes[1, 1].set_title('Stops vs. Average Price')
axes[1, 1].set_xlabel('Stops')
axes[1, 1].set_ylabel('Average Price')

# Show the plots
plt.tight_layout()
plt.show()