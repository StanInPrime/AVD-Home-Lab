# Azure Virtual Desktop Home Lab Project

This is a manually deployed Azure Virtual Desktop (AVD) environment designed for small-to-medium organisation built from scratch using the Azure portal. The goal was to gain deep, hands-on experience with the core components and configuration process of AVD. 

The project also incorporates key enterprise concepts like Conditional Access, FSLogix profile containers, Entra ID integration, Networking, Image configuration and RemoteApp delivery. During the process of implementation I have picked up knowledge of its architecture and use cases through exposure in my current role.


# **Azure Landing Zone**


Before deploying any resources, I carefully planned the structure of the project by designing an architecture diagram. This served as a foundational blueprint for organising core components and visualising how services like AVD, FSLogix, and Entra ID would interact. The planning was inspired by the principles of an Azure Landing Zone—focusing on governance, network layout, identity, and scalability—even though the environment was manually deployed. This step ensured a smoother configuration process and gave me clarity on how to scale the setup in future iterations.

-- Diagram -- 
  


**Technologies used**
- 365 Admin Center
  -  Microsoft 365 Business Premium
- Entra ID
- Azure Portal
- Azure Virtual Desktop (AVD)
- FSLogix Profile Containers
- Azure Storage/Files (Premium File Share)
- Azure Virtual Network (VNet)
- Windows 10/11 Multi-Session Host (AVD Optimized Image)

![image](https://github.com/user-attachments/assets/3b4922ba-5faf-4ffd-9b5f-177d800eeb2c)


**Resource Groups structure**


**1. Microsoft 365 & Entra ID Setup**
- Configured and assigned a custom domain to the tenant
- M365 Business Premium trial
- Created 10 test users | using Mockaroo random data generator 
- Assigned licenses via group-based licensing
- Enforced MFA with Conditional Access
- Configured profile and Office containers in FSLogix

![Uploading image.png…]()


##Image

**2. Networking**
- One VNet with multiple subnet (Fs logix storage, VM and Bastion) 
- Second Vnet for hub-and-spoke network architecture

**3. Storage Configuration**
- Created a Premium Azure File Share for FSLogix
- Enabled Active Directory authentication via Entra ID
- Applied proper NTFS permissions for user profile containers
- Attached storage account to session hosts using appropriate access keys

**4. AVD Configuration**
- Created a pooled host pool
- Registered session hosts with the host pool
- Created a desktop application group
- Assigned users via Entra ID groups
- Implemented Feed URL 
- Configured Azure Bastion for secure access to the session hosts

**5. FSLogix Setup**
- Installed FSLogix on session hosts
- Used registry-based configuration
- Configured a premium Azure Files share
- Enabled identity-based access for users

**6. RemoteApp Deployment**
- Published Notepad and other test apps as RemoteApp
- Verified user assignment and launch from the AVD client
MSIX app attach to do.

**7. Golden Image**
- Deployed a new VM
- Used Virtual Desktop Optimization Tool (VDOT) Github repository to clean the VM
- Use Sysprep to generalize the VM
- Capture the image to a managed image in the same region
- Stored in Compute Gallery

**KEY Learning**

Developed an Azure Landing Zone utilizing Terraform, showcasing my proficiency in cloud architecture
Gained solid hands-on experience with Azure Virtual Desktop and its dependencies
Understood the end-to-end setup process without relying on automation
Learned how Conditional Access policies interact with AVD authentication flow
Configured FSLogix profile containers for user profile persistence
Managed Entra ID group-based licensing and user testing scenarios


**What’s Next?**

I'm currently preparing for my next cloud project, which will focus on designing resilient, cost-effective, and secure architectures using Azure PaaS services. This project will also explore infrastructure automation using tools like Terraform and other IaC methodologies.


