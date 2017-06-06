# Intro
This model was created as a NetLogo project as part of the ABM class at Data ScienceTech Institute. 
The purpose of the model is to study how collaborative and non-collaborative search strategies affect success of finding a job offer good enough to accept it.
 
 
Background Agents live in a torus-shaped space and wander around randomly in search for potential jobs. Available jobs are represented with green-colored patches. Patches can be arranged randomly or in a clustered manner. 
  
  
Agents Agents have their resource called "energy", and use this resource at each step. When an agent runs out of energy, it gets discouraged and stops searching, changing its color. When an agent steps on a green patch, it submits an application and acquires energy, and if energy is larger than a certain threshold, the agent is hired, stops moving and changes its color and the color of the patch (the job is not available anymore).
  
  
Decision Agents can form networks by randomly dropping links to 10% of the total number of agents and collaborate within the network. Collaboration means that when an agent is hired, it invites other agents to come to the neighborhood of the job patch.

# Evaluation
Evaluation The decision about the best strategy is made based on the number of people who find jobs, the number of people who get discouraged, and the total sum of applications agents submitted.
  
  
Main controls Collaborate switch controls the choice of strategies. The observer can select the number of job-seekers. The observer can select the number of jobs available, and the number of clusters they're arranged in. For a totally random spacial distribution of jobs, the observer can select the maximum number of clusters (which is equal to the number of jobs).
   
   
# Plots
The model displays a plot to keep track of the number of available jobs, the number of agents that get discouraged, the total number of applications submitted, and the number of agents that found a job. 
Agents have a random amount of energy between zero and the number chosen by the user with the Max-energy slider. When submitting an application to a job, an agent receives the additional amount of energy that the user can select with the Energy-from-application slider (this amount cannot exceed the Max-energy). Agents take steps of a random length, within the range that the observer can set with the max-distance-per-tick.
   
   
Calculate the difference of results (jobs found, discouraged agents, applications) depending on the chosen strategy. The number of jobs found should be equal to the number of patches that turn grey.
    
    
The observer is encouraged to try different strategies, as well as different cluster settings. The model will also bring different results by using the other sliders.
    
    
# EXTENDING THE MODEL
Try to use one-directional links instead of bi-directional links. Develop a third strategy of competition, where instead of helping each other, agents can compete between each other. Design the model so that jobs are not a fixed resources, but can appear over time.
