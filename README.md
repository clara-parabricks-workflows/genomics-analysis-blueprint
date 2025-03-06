# Parabricks Introduction Notebook 

This repository houses the notebook made to try [Parabricks](https://docs.nvidia.com/clara/parabricks/latest/index.html), a GPU-accelerated software suite for secondary genomic analysis.

The goal of this repository is to help users quickly try the fundamental capabilities of Parabricks on a whole exome data set on their own CUDA capable GPU system, or through the quick deploy capability of [Brev.dev](https://developer.nvidia.com/brev) Launchables. The data set is publicly available from the [Genome in a Bottle](https://www.nist.gov/programs-projects/genome-bottle) Consortium.

This workflow is useful for any bioinformatics scientist or developer who wants to try running Parabricks easily and quickly. If you like the speed and ease of use of Parabricks, you can check out the [latest Parabricks documentation and release information](https://docs.nvidia.com/clara/parabricks/latest/index.html).

# Overview
This repository contains a notebook to help anyone try an introductory analysis workflow leveraging Parabricks. We will focus on the accelerated germline workflow of fq2bam (Containing BWA-MEM, as well as [GATK](https://gatk.broadinstitute.org/) best practices for data processing and quality control) and [DeepVariant](https://github.com/google/deepvariant). A 30x whole genome can be run through fq2bam in as little as 6 minutes on an NVIDIA DGX system, compared to 4-9 hours on a CPU instance (m5.24xlarge, 96 x vCPU). In this example, users will run a whole exome in a matter of minutes.

Below is a diagram of this Short-Read Analysis Workflow - fq2bam includes both alignment, processing and quality control.

![layout architecture](./images/pbworkflow.png)


# System Requirements


| Requirement | Notes |
| -------- | ------- |
| GPU  | We recommend L40S to balance cost and performance.  <br> - Higher performance: A100 <br> - Better cost: L4 and T4 <br>|
| GPU Memory | 38 GB is recommended. <br> - All tools require at least 16 GB of available GPU memory. <br> - For GPUs with 16-38 GB memory, the --low-memory flag is required. |
| System RAM | At least 100 GB. |
| CPU | At least 24 CPU threads. |
| Driver | NVIDIA Driver version 525.60.13 or greater. See documentation about [forward compatibility](https://docs.nvidia.com/deploy/cuda-compatibility/#forward-compatibility). |
| OS | Any Linux OS that supports nvidia-docker2 and Docker version 20.10 or higher. |

Users may have to wait 5-10 minutes for the instance to start depending on cloud availability. 

# Notebooks

### **germline_wes**

- This example uses the Parabricks 4.4.0 release.
- This example uses whole exome (WES) data from sample NA12878. 
- In the first step, we will map the sequence reads to the reference genome. The input FASTQ files are aligned using the Burrows-Wheeler Aligner (BWA) through the Parabricks fq2bam tool. 
- Lastly, we will run DeepVariant, a deep learning based variant caller on the aligned reads. - It uses a convolutional neural network to find single nucleotide variants (SNVs) and insertions/deletions (InDels).

After a user is able to run this flow, they can try running this on their own data as well as explore cloud examples available at the end of the notebook.

# Deployment 

There are two ways to deploy this launchable depending on what level of customization is desired. 

### 1. Using the Brev Launchable (Quick Start)

To launch an instance with our recommended configuration, click here: [![ Click here to deploy the RAPIDS Singlecell Launchable.](https://brev-assets.s3.us-west-1.amazonaws.com/nv-lb-dark.svg)](https://www.google.com)  

### 2. Manual configuration on Brev 

1. Navigate to the [Brev homepage](console.brev.dev). 
2. Open the **Launchables** tab at the top and click **Create Launchable**. 
3. Under **Compute** select any GPU instance that meets the requirements outlined above. During testing, we used 1 L40S GPU with 256GB System RAM and 32 CPUs.
4. Under **Container** we select **Container Mode** > **Custom Container** and enter `nvcr.io/nvidia/clara/clara-parabricks:4.4.0-1`. 
5. For **Files** we use the path to this repository `https://github.com/clara-parabricks-workflows/parabricks-introduction-notebooks.git`
6. For **Export Ports** we name the tunnel "Jupyter" and use port 8888. 
7. Create a descriptive name for the launchable. The instance will take a few minutes to spin up. 
8. Navigate to the notebook at `parabricks-introduction-notebookes/germline_wes.ipynb`. 

# Terms of use
By using this software or model, you are agreeing to the [NVIDIA Parabricks Terms of Use](https://docs.nvidia.com/clara/parabricks/latest/documentation/eula.html).
