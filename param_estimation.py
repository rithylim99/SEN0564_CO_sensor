import numpy as np
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

# Given data points
Cco = np.array([1, 5, 10, 20, 50, 100, 500, 1000])
Vs_minus_Vo = np.array([0.25, 0.65, 0.9, 1.3, 1.8, 2, 2.35, 2.4])

# Define the logarithmic function
def log_func(Cco, a, b):
    return a * np.log10(Cco) + b

# Fit the logarithmic model to the data
popt, _ = curve_fit(log_func, Cco, Vs_minus_Vo)

# Extracting the coefficients a and b
a, b = popt

# Plotting the data and the fitted curve
plt.figure(figsize=(8, 6))
plt.scatter(Cco, Vs_minus_Vo, color='blue', label='Data Points')
plt.plot(Cco, log_func(Cco, *popt), color='red', label=f'Fitted Curve: V_s - V_0 = {a:.3f} * log10(C_co) + {b:.3f}')
plt.xscale('log')
plt.xlabel('CO Concentration (ppm)')
plt.ylabel('V_s - V_0 (V)')
plt.title('Logarithmic Fit for CO Sensor Characteristic')
plt.legend()
plt.grid(True, which='both', linestyle='--', linewidth=0.5)
plt.show()
