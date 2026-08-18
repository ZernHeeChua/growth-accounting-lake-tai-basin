# Growth Accounting in the Lake Tai Basin (太湖流域), 1995-2023
## Project Details
The project involved co-authoring with Brian Lander, Associate Professor of History and Environment and Society at Brown University, 
a paper on post-1970s environmental and urban changes in the Lake Tai basin as a contiguous hydrological unit 
(as opposed to a collection of administrative units). Central to the above changes was rapid economic growth and development, 
which the paper briefly expounds on with growth accounting. 

## Code Description
The main purpose of the growth accounting exercise is to simply show that physical capital accumulation, while important, played a progressively smaller role in economic growth in the Lake Tai basin. Other factors, such as human capital accumulation and productivity improvements, became increasingly significant, though their respective contributions are not quantitatively specified in the paper, given its non-economics focus. Complete data across the six identified prefectures and municipalities - Shanghai, Suzhou, Wuxi, Changzhou, Huzhou, and Jiaxing - were available only in the period 1995-2023. 

Referencing the graph in the following section, I plot actual per-capita income ratios against predicted per-capita income ratios for each year in the period 1995-2023. "Ratio" refers to the per-capita incomes in any given year relative to 
that of the base year, 1995. Mathematically, actual per-capita incomes relative to 1995 can be expressed as $\frac{y_t}{y_{1995}}$, while predicted per-capita incomes relative to 1995 can be written as $\frac{\hat{y_t}}{\hat{y_{1995}}}$. Here, $y$ is income per capita and $t$ refers to any year between 1995 and 2023. Given the above explanation on what predicted per-capita incomes refer to, $\frac{\hat{y_t}}{\hat{y_{1995}}}$ can be expressed as follows

$$
\frac{\hat{y_t}}{\hat{y_{1995}}} = \left( \frac{k_t}{k_{1995}} \right)^\alpha \approx \left( \frac{k_t}{k_{1995}} \right)^{0.42}
$$

where $k$ refers to capital per capita. $\alpha$ refers to the capital share of national income, and $\alpha \approx 0.42$ is the average capital share of income in China between 1975 and 2017 (Ashraf \& Weil, 2024; Feenstra et al., 2015). I recognize that it would be ideal to derive for each year a distinct value of $\alpha$, though limited prefecture-level data on non-wage returns to labor, like bonuses and insurance claims, have precluded such attempts. As for the values for population growth, productivity growth rate, and physical capital depreciation, their justifications have been written in the Stata do file.

## Graph
<img width="1106" height="837" alt="Lake Tai Basin Growth Accounting" src="https://github.com/user-attachments/assets/108e1f13-49f2-46be-a2d6-ed00c5168682" />

Key data sources include the Penn World Table (PWT) 11.0 and the statistical yearbooks of the six respective Municipal Bureaus of Statistics.
