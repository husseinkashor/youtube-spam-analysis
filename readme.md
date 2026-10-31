\# YouTube Spam Analysis — Big Data Assignment 1



\## Project Overview



This project analyzes the YouTube Spam Collection dataset using Python, text processing, and machine learning. The project runs inside a Docker container using JupyterLab.



The workflow includes:

\- Dataset inspection and preprocessing

\- Missing-value and duplicate analysis

\- Data transformations and sampling

\- Text cleaning and exploratory text analysis

\- TF-IDF feature extraction

\- Supervised spam classification

\- Unsupervised clustering using K-Means



\## Project Structure



```text

bd-a1/

├── Dockerfile

├── requirements.txt

├── README.md

├── data/

│   └── dataset.csv

├── notebook/

│   └── analysis.ipynb

├── output/

│   ├── cleaned\_data.csv

│   ├── model\_metrics.txt

│   ├── cluster\_summary.txt

│   ├── figures/

│   └── models/

└── screenshots/

```



\## Technologies



\- Python

\- Pandas and NumPy

\- Matplotlib and Seaborn

\- Scikit-learn

\- NLTK

\- Docker

\- JupyterLab



\## Docker Setup



\### Build the image



```powershell

docker build -t husseinkashor/youtube-spam-analysis:v3 .

```



\### Run the container



```powershell

docker run -d --name youtube-spam-v3 -p 8890:8888 -v "${PWD}/output:/home/jovyan/bd-a1/output" husseinkashor/youtube-spam-analysis:v3

```



Open JupyterLab at:



```text

http://localhost:8890/lab

```



Use the access token printed by the container logs if JupyterLab requests one:



```powershell

docker logs youtube-spam-v3

```



\### Docker Hub



The project image is published under:



```text

husseinkashor/youtube-spam-analysis:v3

```



Pull it using:



```powershell

docker pull husseinkashor/youtube-spam-analysis:v3

```



Run the pulled image using:



```powershell

docker run -d --name youtube-spam-test -p 8890:8888 -v "${PWD}/output:/home/jovyan/bd-a1/output" husseinkashor/youtube-spam-analysis:v3

```



\## Data and Analysis



The notebook performs data inspection, preprocessing, sampling, feature engineering, and text analysis. It creates a cleaned text column while retaining the original text.



Text features include character count, word count, unique word count, and average word length. Text analysis includes token statistics, frequent words, stopword comparison, and Spam-versus-Ham comparisons.



\## Machine Learning



TF-IDF is used to represent text numerically. The supervised models evaluated are:



\- Multinomial Naive Bayes

\- Logistic Regression

\- Linear Support Vector Classifier



The models are evaluated using accuracy, precision, recall, F1-score, and a confusion matrix. Linear SVC achieved the best accuracy in the recorded experiments.



K-Means clustering is also applied to the TF-IDF representation to explore text groupings and compare them with the known Spam and Ham labels.



\## Output Files



\- `output/cleaned\_data.csv` — preprocessed dataset

\- `output/model\_metrics.txt` — supervised model evaluation results

\- `output/cluster\_summary.txt` — K-Means cluster summary

\- `output/figures/` — generated visualizations



\## Persistence



The Docker image contains the project dataset and notebook. The output directory is mounted from the host machine using a Docker bind mount. This allows generated output files to remain on the host even if the container is removed.



\## Image and Container



A Docker image is the packaged template containing the application environment and project files. A container is a running instance of that image.



The `-p 8890:8888` option maps port 8888 inside the container to port 8890 on the host, allowing access to JupyterLab through the browser.



The `-v` option mounts the host output directory into the container so generated files persist outside the container.



