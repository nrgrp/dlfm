# dlfm

Code accompanies the paper "Multi-convex Programming for Discrete Latent Factor Models Prototyping".

The [implementation.ipynb](implementation.ipynb) contains the framework 
implementation described in section 5 of the paper.

The jupyter notebook corresponding to the examples mentioned 
in the paper are under the folder [examples](examples).

## Dependencies

We manage dependencies through [uv](https://docs.astral.sh/uv/).
Once you have installed uv you can perform
```shell
make install
```
to replicate the virtual environment we have defined in
[pyproject.toml](pyproject.toml) and locked in [uv.lock](uv.lock).

## Run the examples

To reproduce the examples mentioned in the paper, we install [JupyterLab](https://jupyter.org/)
on the fly within the aforementioned virtual environment.
Executing
```shell
make jupyter
```
will install and start the jupyter lab.
