Return to the <a href="https://github.com/Project-Herophilus/DataSynthesis" target="_blank">Main DataSynthesis Page</a>

# Jupyter Notebook Data Loading
The easiest thing we could have done is make this a complete SaaS based offering. We are cognizant of the potential for
partners to build out potential services offering down the road. We also want to ensure that organizations can
have control of the data.

# Data Loading
All of the data loading scripts and efforts are being built around Jupyter Notebooks.

# Data Loading Notebook Loading Order

| Jupyer Notebook                | Platform Capabilities It Loads                                                             | 
|--------------------------------|--------------------------------------------------------------------------------------------|
| ReferenceData-Loader           | Loads all platform support reference data                                                  |
| PlatformData-Loader            | Loads all platform base platform data                                                      |
| ImplementationData-Loader      | Loads all platform base implementation data and data model data                            |
| ExistingData-Loader-1          | Loads all existing existing data except for First and Last Names                           |
| ExistingData-Loader-FirstNames | Loads only First Names                                                                     |
| ExistingData-Loader-LastNames  | Loads only Last Names                                                                      |
| GeneratedData-Loader-1         | Loads all generated data (before what your implementation does) except US Drivers Licenses |
| GneeratedData-Loader-DLN       | Loads US Drivers Licenses all 50 States                                                    |

Happy coding!!!
