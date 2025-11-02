This project demonstrates high-performance Bash scripting to process and analyze **3D coordinate data** entirely in Bash, without relying on Python or C++. Executed on the **Fry High-Performance Computing (HPC) cluster**, the script calculates Euclidean distancesbetween points and identifies the nearest neighbor for a reference point.

Key highlights:  
- Automation and scripting precision  
- HPC workflow and reproducibility  
- Data parsing and numerical computation in Bash  


🎯 Objectives
- Read CSV input files with names and X, Y, Z coordinates. 
- Store data in Bash arrays.  
- Compute Euclidean distances using `bc`.  
- Identify the nearest neighbor to a reference point.  
- Validate inputs and generate structured output.  
- Package results for submission or transfer.

🧰 Technologies & Skills
- Bash: Script logic, loops, arrays, automation.
- bc: Floating-point arithmetic & square root calculation.
- Fry HPC (WSu): High-performance computing environment.
- Unix CLI: File parsing, looping, conditionals. 
-tar / scp: Archiving and secure file transfer.

🧮 Algorithm

Euclidean distance formula used:
d = sqrt((x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2)

🖥️ Execution Steps on Fry HPC

1.Connect to Fry HPC
Use SSH to log in to the HPC environment:
ssh your_username@fry.cs.wright.edu

2.Navigate to your project folder:
cd ~/proj01

3.Make the Bash script executable
chmod +x proj01.sh

4.Run the script
Provide the input file and the reference index (example index 2):
./proj01.sh sampleInputFile 2 > correspondingOutput

5.cat correspondingOutput.
   
6.Package the project for submission or sharing:
tar -zcf proj01.tgz proj01/

7.Optional: Download the archive locally:
scp your_username@fry.cs.hpc.edu:~/proj01.tgz ~/Downloads/






