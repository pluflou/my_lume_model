# My LUME Model

This repository packages the `MyLumeModel` in `my_lume_model/model.py ` for execution with [Prefect](https://docs.prefect.io/) using the flow described in `my_lume_model/flow/flow.py` using the variables:

<!--- The input and output variable tables are replaced when generating the project in template/hooks/post_gen_project.py-->
# input_variables
|variable name| type |default|
|-------------|------|------:|
|input1       |scalar|      1|
|input2       |scalar|      2|


# output_variables
|variable_name| type |
|-------------|------|
|output1      |scalar|
|output2      |scalar|
|output3      |scalar|



## Installation

This package may be installed using pip:
```
pip install git+https://github.com/pluflou/my_lume_model.git
```


## Dev

Install dev environment:
```
conda env create -f dev-environment.yml
```

Activate your environment:
```
conda activate my-lume-model-dev
```

Install package:
```
pip install -e .
```

Tests can be executed from the root directory using:
```
pytest .
```

### Note
This README was automatically generated using the template defined in https://github.com/slaclab/lume-services-model-template with the following configuration:

```json
{
    "author": "smiskov",
    "email": "smiskov@slac.stanford.edu",
    "github_username": "pluflou",
    "github_url": "https://github.com/pluflou/my_lume_model.git",
    "project_name": "My LUME Model", 
    "repo_name": "my-lume-model", 
    "package": "my_lume_model",
    "model_class": "MyLumeModel"
}
```
