# pacejka model parameter finder

When creating a vehicle dynamics model is it necessary to take into account the effect of slip ratios on longitudinal forces. A common industry leading model exists called the pajecka model that maps the slip ratios and normal force to the longitudinal forces of a vehicle. However, the model has several parameters that needs to fit to a specific vehicle. I have coded from scratch a gradient descent optimization algorithm to find the optimal parameters of the pacejka model for our specific car data. 

The code finding optimal parameters of the pacejka model can be found in this [matlab script.](https://github.com/AbdulRahmanSilmy/Pacejka_model_finder/blob/main/pacejka_para_optimizer.m).

## Achieving pacejka model parameters

### Steps

- Normalize the measured data point point values against its corresponding normal force values. This makes calculations easier and is possible because normal force is a multiplication factor in the pacejka model.
- Set up the cost function as the RMSE of the measured longitudinal force against the calculated longitudinal force.
- Because of the complexity of the pacejka model I utilized numerical approximation of a gradient called the symmetric difference quotient. 
- Performed gradient descent based on the numerical approximation of gradient.

### The Gradient Descent Graph

<img src="https://github.com/AbdulRahmanSilmy/vehicle_dynamic_model/blob/main/RMSE%20vs%20steps.jpg" width="600" height="600" />



## Analysis of Performance

![alt text](https://github.com/AbdulRahmanSilmy/vehicle_dynamic_model/blob/main/analysis%20of%20model.jpg)

When examining the above graph it is evident that at the slip ratio of zero that majority of measurement points have a positive longitudinal force. Theorotically there shouldn't be any longitudinal force when slip ratio is zero. This leads me to conclude that there might be a systematic error in the measurements that cause the measurements to be too positive specially close to slip ratio of zero. This is a possible explanation to the gradient descent plateau in the graph.

