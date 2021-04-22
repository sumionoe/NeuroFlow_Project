"""
Given the information you have and any light research you’d like to do on the
topic, what insights can you draw?
What assumptions have you made about the data?
What are 2-3 additional pieces of information that would be important to collect?
"""
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

def main():
    df = pd.read_csv('phq_all_final.csv')
    df.plot.scatter(x='date', y='score')
    plt.show()

main()
