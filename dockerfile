# Base image with PyTorch and Jupyter support
FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime

# Set the working directory
WORKDIR /app

# Copy the notebook into the container
ARG NOTEBOOK
COPY $NOTEBOOK /app/notebook.ipynb

# Copy the requirements file
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Jupyter Notebook will run on
EXPOSE 8888

# Run Jupyter Notebook
CMD ["jupyter", "notebook", "notebook.ipynb", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
