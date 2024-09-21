# A Rubik's Cube Solution Using Deep-Learning and Robotic Arm Coordination

# Software Engineering
## Overview
![SW02_ The Process1_process_20240306_page-0001](https://hackmd.io/_uploads/HJGQEppX0.jpg)

Software (product) engineering (process)
: <br>is the <font color=#335EFF>technological</font> and <font color=#1FCC13 >managerial</font> discipline concerned with systematic production and maintenance of software products that are developed and modified on time and within cost constraints.
:::spoiler Software Engineering vs. System Engineering
* software engineering is an engineering discipline which is concerned with all aspects of software production.
* System engineering is concerned with all aspects of computer-based systems development, including hardware, software and process engineering.

:::

<br>Process
: <br>a set of ordered tasks involving ++activities++, ++constraints++, and ++resources++ that produce an intended output of some kind.

Product
: <br>++computer programs++ + ++data++ + ++documentations++

## Process
&nbsp;
![SW02_ The Process1_process_20240306_page-0019](https://hackmd.io/_uploads/H1q3Vp6X0.jpg)
### Capability Maturity Model Integration (CMMI)
CMMI helps assess how mature an organization's processes are and provides a framework to improve them. This can lead to increased efficiency, better quality products and services, and reduced risk.
![SW02_ The Process2_CMMI_20240314_page-0008](https://hackmd.io/_uploads/rkmvytlNA.jpg)
![SW02_ The Process2_CMMI_20240314_page-0009](https://hackmd.io/_uploads/rywP1FeVA.jpg)
![SW02_ The Process2_CMMI_20240314_page-0016](https://hackmd.io/_uploads/rk9DJFgEC.jpg)
![SW02_ The Process2_CMMI_20240314_page-0019](https://hackmd.io/_uploads/BJAP1teNR.jpg)
### Development Overview
Model
: <br>model is a  ++simplified representation of a system++ over some time period or spatial extent intended to promote understanding of the real system.

Software Development Life Cycle Model (SDLC)
: <br>a simplified representation of a software process used by the software industry to design, develop and test high quality software . 
- Waterfall Model
&nbsp;
![image](https://hackmd.io/_uploads/r11YwapQC.png)
&nbsp;
When to use the waterfall model:
    - The project size is small. 
    - The requirements are clearly defined and fixed.
- V Model
![image](https://hackmd.io/_uploads/SklaclQE0.png)
&nbsp;
When to use the V-model:
    - The project size is small to medium.
    - The requirements are clearly defined and fixed.
    :::spoiler Verification vs Validation
    - Verification
        - The purpose of verification is to ensure that the outputs of each stage of the software development process (such as requirement specifications, design documents, code, etc.) correctly reflect the inputs of the previous stage. In other words, verification is about ++ensuring we are building the product right++.
        - Question: "Are we building the system right?"
        - Objects: Design specifications, documents, code, etc.
        - Methods: Walkthroughs, inspections, reviews, static analysis, unit testing, etc.
        - Examples: Ensuring that the code complies with the design specifications; checking the correctness and consistency of requirement specifications.
    - Validation
        - The purpose of validation is to ensure that the final software product meets the user's needs and intended use. In other words, validation is about  ++ensuring we are building the right product++.
        - Question: "Are we building the right system?"
        - Objects: Final product
        - Methods: Functional testing, system testing, acceptance testing, user testing, etc.
        - Examples: Verifying that the software meets user requirements; conducting user tests to confirm the software's usability and functionality.
    - Key Differences
        - Purpose: Verification ensures the correctness of outputs during each stage of development; validation ensures that the final product meets user needs.
        - Objects: Verification focuses on documents, designs, and code (intermediate products); validation focuses on the final product. 
        - Methods: Verification uses static methods such as reviews and inspections; validation uses dynamic methods such as testing and running.
    :::
- Rapid Application Development Models (RAD)
![image](https://hackmd.io/_uploads/BJtP_6pXR.png)
&nbsp;
When to use RAD model:
    - The requirements are clearly defined and fixed.
    - There is a need to deliver a system in a short timeframe, typically within 2-3 months.
    - The system can be effectively modularized, allowing for iterative development and quick delivery of individual modules.
    
- Evolutionary Software Process Model
&nbsp;
![image](https://hackmd.io/_uploads/rk8i66TQ0.png)
    - Iterative Model
&nbsp;
        - Prototyping Model
        ![image](https://hackmd.io/_uploads/rJ2v7AamC.png)
When to use the prototyping model:
            - The requirements are uncertain.
            - The requirements are likely to change.
            - You may also find that you’re ready to get started on a project, but investors or stakeholders are unable to see the value. 
            - Prototyping is also a solid choice if you have a small budget.
              (By investing minimal time and resources in building a prototype, the team can mitigate risks and ensure project feasibility before committing more resources.)
        - Spiral Model
![image](https://hackmd.io/_uploads/BygRDHeEA.png)
When to use the spiral model:
            - The requirements are uncertain.
            - The requirements are likely to change.
            - The project size is big.
            - New product line.
            - When costs and risk evaluation is important.
    - Incremental Model
    ![image](https://hackmd.io/_uploads/H1Tu5rgNC.png)
When to use the incremental model:
        - The requirements are certain.
        - The requirements are likely to change.
        - There is a need to get a product to the market early.
        - When costs and risk evaluation is important.(the incremental model reduces risk by breaking the project into smaller increments)
    - Incremental iterative Model
&nbsp;
        - Agile model
![image](https://hackmd.io/_uploads/S12OASxEC.png)
When to use the Agile model:
            - The requirements are uncertain. 
            - The requirements are likely to change.
            
### Development-Analysis
Requirements engineering
: <br> Requirements engineering is the process of ++defining++, ++documenting++, and ++maintaining++ requirements. (builds a bridge from the system requirements into software design and construction.)

    
    Requirement engineering consists of seven different tasks as follow:

1. Inception
    - Inception is a task where the requirement engineering asks a set of questions to establish a software process.
    - In this task, it understands the problem and evaluates with the proper solution.
    - It collaborates with the relationship between the customer and the developer.
    - The developer and customer decide the overall scope and the nature of the question.
    - Can be done through Context-Free Questions (CFQ)
2. Elicitation
    - Elicitation means to find the requirements from all stakeholders.
    - Elicitation are difficult because the following problems occur:
        - Problem of scope: The customer give the unnecessary technical detail rather than clarity of the overall system objective.
        - Problem of understanding: Poor understanding between the customer and the developer regarding various aspect of the project like capability, limitation of the computing environment.
        - Problem of volatility: In this problem, the requirements change from time to time and it is difficult while developing the project.
    - Can be done through Facilitated Application Specification Techniques (FAST) or Quality Function Deployment (QFD)
        :::spoiler QFD
        - In this technique, translate the customer need into the technical requirement for the software.
        - QFD system designs a software according to the demands of the customer.
        - QFD consist of three types of requirement:
            - Normal requirements
            - Expected requirement
            - Exciting  requirements
        :::

3. Elaboration
    - In this task, the information taken from user during inception and elicitation are expanded and refined in elaboration.
    - create an analysis model that identifies data,function and behavioral requirements.
    - Can be done through Scenario-Based Modeling or Analysis Modeling.
        :::spoiler Scenario vs Use-Case
        - Scenarios are real-life examples of how a system can be used.
        - Use-Case is a collection of scenarios that describe the thread of usage of a system. Each scenario is described from the point-of-view of an “actor”—a person or device that interacts with the software in some way. 
        :::
        :::spoiler Analysis Modeling
        ![SW11_Requirement Engineering_Analysis Concepts and             Principles_20240516_page-0036](https://hackmd.io/_uploads/H10vdTeVR.jpg)
        :::


4. Negotiation 
    - agree on a deliverable system that is realistic for developers and customers.
    - Work towards a set of requirements that result in a 'win-win' situation for stakeholders.

5. Specification
    - The specification is the final work product produced by the requirements engineer.
    - The work product is in the form of ++software requirement specification++.
    - It serves as the foundation for subsequent software engineering activities.
    - can be any one (or more) of the following:
        -  A written document
        - A set of models
        - A formal mathematical
        - A collection of user scenarios (use-cases)
        - A prototype 
        
6. Validation
    - Examine the specification to ensure complete, consistent, and accurate.
    - The primary requirements validation mechanism is the ++formal technical review++.

7. Requirements Management
    - A set of activities help the project team identify, control, and track requirements and changes to requirements at any time as the project proceeds.
    - Can be done through Traceability Table.
    
### Management Overview
The Management Spectrum (4P) :
1. People
    - The most important element of a successful project. Key areas for software people recruiting, selection, performance management, training, compensation, career development, organization & work design, team/culture development.
    - PM-CMM (People Management Capability Maturity Model)
     :::spoiler Team Organizational Paradigms 
    - closed paradigm: along  a traditional hierarchy of authority (CC：Controlled Centralized)
    - open paradigm: achieves some of the controls, closed paradigm but also much of the innovation, using the random paradigm (CD：Controlled Decentralized)
    - random paradigm: structures a team loosely and depends on individual initiative of the team members (DD：Democratic Decentralized)
    &nbsp;
    ![image](https://hackmd.io/_uploads/ByIjxlm4C.png)
    ![圖片1](https://hackmd.io/_uploads/BkwFP0M40.png)
     :::
2. Product
    - The software to be built 
    - Software Scope
        - Context: How does the software to be built fit into a larger system, product, or business context, and what constraints are imposed as a result of the context?
        - Information objectives: What customer-visible data objects are produced as output from the software? What data objects are required for input?
        - Function and performance: What function does the software perform to transform input data into output? Are any special performance characteristics to be addressed?
    - Problem Decomposition / Partition
3. Process
    - The set of framework activities and software engineering tasks to get the job done(framework activities populated with tasks, milestones, work products, and QA points)
    - Process decomposition
        - Common Process Framework (CPF)
    - Select the Software Development Life Cycle Model
    - Melding Product and Process
    ![image](https://hackmd.io/_uploads/SkMx6AG4R.png)
4. Project
    - All work required to make the product a reality. (Planning, monitoring, controlling)













###  Measurement
![image](https://hackmd.io/_uploads/SkaRPZQEA.png)

Measure
: A measure is a single, quantitative value that describes a specific attribute or characteristic. It is the most basic unit of data collection in software engineering.
- Direct measures:cost,LOC...
- Indirect measures:quality, complexity...

Metric
: A metric is a composite measure, often derived from one or more measures through a specific calculation or formula. Metrics are used to evaluate or compare the performance of specific attributes.
- Size-Oriented Metrics
- Function-Oriented Metrics

Indicator
: An indicator is a signal or marker that provides information about trends, conditions, or performance. Indicators are typically based on metrics or measures and are used to support decision-making.

:::spoiler Measure vs Metric vs Indicator
- Level of Complexity:
    - Measure: The simplest form, representing raw data.
    - Metric: More complex, requiring calculation or aggregation of multiple measures.
    - Indicator: The most complex, often derived from metrics and used to indicate broader trends or issues. 
- Purpose:
    - Measure: Provides basic, raw data about specific attributes.
    - Metric: Used for evaluating and comparing specific performance aspects.
    - Indicator: Used for decision support, indicating trends or potential problem areas.
- Example
    - Measure:Lines of Code (LOC),Number of defects
    - Metric: Defect density = Number of defects / Lines of Code
    - Indicator: Quality Indicator














