# pacejka model parameter finder

When creating a vehicle dynamics model is it necessary to take into account the effect of slip ratios on longitudinal forces. A common industry leading model exists called the pajecka model that maps the slip ratios and normal force to the longitudinal forces of a vehicle. However, the model has several parameters that needs to fit to a specific vehicle. 



## Achieving pacejka model parameters

### Steps

- Set up the cost function as the RMSE of the measured longitudinal force against the calculated longitudinal force
- Because of the complexcity of the pacejka model utilize numerical approximation of a gradient called the symmetric difference quotient 
- Perform gradient descent based on the numerical approximation of gradient

### The Gradient Descent Graph

![alt text](https://github.com/AbdulRahmanSilmy/vehicle_dynamic_model/blob/main/standard%20error%20vs%20steps.jpg)

## Analysis of Performance

![alt text](https://github.com/AbdulRahmanSilmy/vehicle_dynamic_model/blob/main/analysis%20of%20model.jpg)

When examining the above graph it is evident that at the slip ratio of zero that majority of measurement points are positive longitudinal force. Theorotically there shouldn't be any longitudinal force when slip ratio is zero. This leads me to conclude that there might be a systematic error in the measurements that cause the measurements to be to positive specially close to the slip ratio of zero. This is a possible explanation to the gradient descent plateau in the graph.

