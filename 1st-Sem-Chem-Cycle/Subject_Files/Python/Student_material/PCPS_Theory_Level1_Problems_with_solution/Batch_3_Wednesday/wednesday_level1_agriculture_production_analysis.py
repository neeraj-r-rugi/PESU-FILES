import csv

# Load data from text file
def load_data(file_name):
    data = []
    with open(file_name, 'r', newline='') as file:
        reader = csv.reader(file)
        header = next(reader)  # Skip the header
        for row in reader:
            # Convert Production and Price to float, and store as a tuple
            data.append((row[0], row[1], row[2], float(row[3]), float(row[4])))
           
    return data

# 1. Total Yield by Crop Type
def total_yield_by_crop(data):
    yield_by_crop = {}
    for row in data:
        crop = row[1]
        if crop not in yield_by_crop:
            yield_by_crop[crop] = 0
        yield_by_crop[crop] += row[3] 
        
    return yield_by_crop

# 2. Average Price by Crop Type
def average_price_by_crop(data):
    price_sum = {}
    count = {}
    for row in data:
        crop = row[1]
        if crop not in price_sum:
            price_sum[crop] = 0
            count[crop] = 0
        price_sum[crop] += row[4]
        count[crop] += 1

    average_price = {}
    for crop in price_sum:
        average_price[crop] = price_sum[crop] / count[crop]
    return average_price

# 3. Identify High-Yield Crops by Region
def high_yield_crops_by_region(data):
    yield_by_region = {}
    for row in data:
        region = row[2]
        crop = row[1]
        if region not in yield_by_region:
            yield_by_region[region] = {}
        if crop not in yield_by_region[region]:
            yield_by_region[region][crop] = 0
        yield_by_region[region][crop] += row[3]
    
    high_yield_crops = {}
    for region in yield_by_region:
        max_crop = None
        max_yield = 0
        for crop, yield_value in yield_by_region[region].items():
            if yield_value > max_yield:
                max_yield = yield_value
                max_crop = crop
        high_yield_crops[region] = (max_crop, max_yield)
    return high_yield_crops

# 4. Calculate Total Revenue by Region
def total_revenue_by_region(data):
    revenue_by_region = {}
    for row in data:
        region = row[2]
        revenue = row[3] * row[4]  # Production * Price
        if region not in revenue_by_region:
            revenue_by_region[region] = 0
        revenue_by_region[region] += revenue
    return revenue_by_region

# 5. Most Profitable Crop in Each Region
def most_profitable_crop(data):
    profit_by_region = {}
    for row in data:
        region = row[2]
        crop = row[1]
        revenue = row[3] * row[4]  # Production * Price
        if region not in profit_by_region:
            profit_by_region[region] = {}
        if crop not in profit_by_region[region]:
            profit_by_region[region][crop] = 0
        profit_by_region[region][crop] += revenue
    
    most_profitable = {}
    for region in profit_by_region:
        max_crop = None
        max_profit = 0
        for crop, profit_value in profit_by_region[region].items():
            if profit_value > max_profit:
                max_profit = profit_value
                max_crop = crop
        most_profitable[region] = (max_crop, max_profit)
    return most_profitable

# 6. Region with Highest Total Yield
def region_with_highest_total_yield(data):
    yield_by_region = {}
    for row in data:
        region = row[2]
        if region not in yield_by_region:
            yield_by_region[region] = 0
        yield_by_region[region] += row[3]
    
    highest_region = None
    highest_yield = 0
    for region, yield_value in yield_by_region.items():
        if yield_value > highest_yield:
            highest_yield = yield_value
            highest_region = region
            
    return highest_region, highest_yield


# 7. Summarize Yearly Production for a Crop
def yearly_production_summary(data, crop_name):
    production_by_year = {}
    for row in data:
        if row[1] == crop_name:
            year = row[0].split('-')[2]  # Extract year from date
            if year not in production_by_year:
                production_by_year[year] = 0
            production_by_year[year] += row[3]
    return production_by_year

# 8. Sort Regions by Average Price
def sort_regions_by_average_price(data):
    price_sum = {}
    count = {}
    
    for row in data:
        region = row[2]
        price = row[4]
        
        if region not in price_sum:
            price_sum[region] = 0
            count[region] = 0
        price_sum[region] += price
        count[region] += 1
    
    average_price = {}
    for region in price_sum:
        average_price[region] = price_sum[region] / count[region]
    
    sorted_regions = []
    for region in average_price:
        sorted_regions.append((region, average_price[region]))
    
    # Sort by average price
    sorted_regions.sort(key=lambda item: item[1], reverse=True)
    return sorted_regions

# 09. Add New Crop Data
def add_new_crop(data, date, crop, region, production, price):
    new_entry = (date, crop, region, float(production), float(price))
    data.append(new_entry)

    # Append to the CSV file
    with open("agri.csv", 'a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(new_entry)
        
# 10. Find Highest and Lowest Prices for a Crop
def high_low_prices_for_crop(data, crop_name):
    prices = []
    for row in data:
        if row[1] == crop_name:
            prices.append(row[4])
    if prices:
        highest_price = max(prices)
        lowest_price = min(prices)
        return {'highest_price': highest_price, 'lowest_price': lowest_price}
    return {'highest_price': None, 'lowest_price': None}
        

# 11. Identify Underperforming Crops        
def underperforming_crops(data, yield_threshold):
    yield_by_crop = total_yield_by_crop(data)  # Reuse the total_yield_by_crop function
    underperformers = {}
    for crop, yield_value in yield_by_crop.items():
        if yield_value < yield_threshold:
            underperformers[crop] = yield_value
    return underperformers

# Main execution with user menu
file_name = 'agri.csv'
agriculture_data = load_data(file_name)
while True:
        print("\nMenu:")
        print("1. Total Yield by Crop Type")
        print("2. Average Price by Crop Type")
        print("3. Identify High-Yield Crops by Region")
        print("4. Calculate Total Revenue by Region")
        print("5. Most Profitable Crop in Each Region")
        print("6. Region with Highest Total Yield")
        print("7. Summarize Yearly Production for a Crop")
        print("8. Sort Regions by Average Price")
        print("9. Add New Crop Data")
        print("10. Find Highest and Lowest Prices for a Crop")
        print("11. Identify Underperforming Crops")
        print("0. Exit")

        choice = input("Enter your choice (0-11): ")

        if choice == '1':
            print("Total Yield by Crop Type:", total_yield_by_crop(agriculture_data))
        elif choice == '2':
            print("Average Price by Crop Type:", average_price_by_crop(agriculture_data))
        elif choice == '3':
            print("High-Yield Crops by Region:", high_yield_crops_by_region(agriculture_data))
        elif choice == '4':
            print("Total Revenue by Region:", total_revenue_by_region(agriculture_data))
        elif choice == '5':
            print("Most Profitable Crop in Each Region:", most_profitable_crop(agriculture_data))
        elif choice == '6':
            print("Region with Highest Total Yield:", region_with_highest_total_yield(agriculture_data))
        elif choice == '7':
            crop_name = input("Enter the crop name: ")
            print(f"Yearly Production Summary for {crop_name}:", yearly_production_summary(agriculture_data, crop_name))
        elif choice == '8':
            sorted_regions = sort_regions_by_average_price(agriculture_data)
            print("Regions sorted by average price (highest to lowest):", sorted_regions)
        elif choice == '9':
            date = input("Enter date (DD-MM-YYYY): ")
            crop = input("Enter crop name: ")
            region = input("Enter region: ")
            production = input("Enter production: ")
            price = input("Enter price: ")
            add_new_crop(agriculture_data, date, crop, region, production, price)
            
        elif choice == '10':
            crop_name = input("Enter the crop name: ")
            print(f"Highest and Lowest Prices for {crop_name}:", high_low_prices_for_crop(agriculture_data, crop_name))
        
        elif choice == '11':
            yield_threshold = float(input("Enter yield threshold: "))
            underperforming = underperforming_crops(agriculture_data, yield_threshold)
            print("Underperforming Crops:", underperforming)
        elif choice == '0':
            print("Exiting...")
            break
        else:
            print("Invalid choice! Please enter a number between 0 and 11.")
    
