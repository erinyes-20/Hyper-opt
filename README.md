## Hyper-opt description:
This project was created with the aim of understanding and implementing the Iterative Preconditioned Gradient Descent (IPG) algorithm by Dhruv Srinivasan, Kushal Chakrabarti. IPG is used to optimize quantum circuit parameters in order to model quantum algorithmic circuit configurations to high fidelity while maintaining low depth. The paper posits that IPG performs better than Adam on non-convex problems and is noise-resistant. This implementation is constrained by my understanding of the paper.

## Workflow:
The circuit ansatz was templated and a custom IPG optimizer was written by subclassing the general pytorch optimizer class. The setup was tested with a GHZ state preparation test. Milestones include:

1. Build simple problems like quadratic and Styblinski functions	
2. Test CG/NM and measure rate of convergence on them in Matlab
3. Verify the built IPG with metrics (signs of conv k*, rate of conv) on simple problems
4. Create the parametrized quantum circuit framework
5. Run IPG on q-circuit parameters

## Paper Description:
Formally, the goal is to compute a parameter vector x such that x = argmin(f(x)). The cost function f(x) is a measure of similarity between the target state/matrix and the output obtained by propagating a zero state vector through the parametrized quantum circuit. Its value is fed into the classical IPG optimizer to tune the parameters of the circuit ansatz. The hybrid nature of the framework is illustrated in the fig. 

![q_circuit](https://github.com/erinyes-20/Hyper-opt/assets/158277210/e498ea55-7587-4406-9b62-df5cc5fcb5b3)  

![ansatz](https://github.com/erinyes-20/Hyper-opt/assets/158277210/98796bd8-7197-4840-9f2c-f4b7ea5d3967)

## Avenues of further improvement:
1) Prepare other states to test general capability - already have highly entangled GHZ
2) Ansatz with different combination of CNOT gates
3) Cost function for QFT - trace(U_original_matrix.T * U_from_our_circuit)

## Acknowledgements:
1. The original [IPG paper](https://arxiv.org/abs/2309.09957)
2. [Pennylane guide](https://pennylane.ai/qml/demos/tutorial_state_preparation/) on training quantum circuits using pytorch backend
3. [Ada-hessian](https://github.com/amirgholami/adahessian) for inspiration on plots


