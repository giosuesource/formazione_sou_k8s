
# Step. 4
Lo scopo di questo esercizio è quello di scrivere una pipeline dichiarativa Jenkins che prenda da GIT il repo chart versionato in "formazione_sou_k8s" ed effettui "helm install" sull'instanza K8s locale su namespace "formazione_sou".

Per svolgere questo step sono stati effettuati dei passaggi preliminari, per iniziare è stato installato Hypervisor su macchina host ed è stato modificato il playbook precedentemente configurato nello step 2, andando ad implementare Helm e Kubectl all' interno del container Slave. Siamo inoltre andati a modificare i "Volumes" del ContainerS, andando ad aggiungere il volume "/var/run/docker.sock:/var/run/docker.sock" e "/usr/bin/docker:/usr/bin/docker". Il primo volume ci consentirà di creare un "canale" che permetterà al ContainerS di comunicare direttamente con il daemon di Docker presente sull'host, il secondo ci permetterà di utilizzare "docker" presente sulla macchina Host all' interno di ContainerS.

Lato Kubernetes, per fare in modo che Container e macchina Host (su cui avevamo già installato Minikube nello step 1) potessero comunicare, abbiamo effettuato la copia del File config dalla macchina Host al container Slave, nel percorso /.kube/config. 
Abbiamo poi effettuato anche la copia dei certificati Client.key, Client.crt e Ca.crt da Host a ContainerS nel percorso /home/jenkins. Siamo poi andati a modificare i 2 file config, andando a specificare il percorso di questi certificati nell' apposito spazio.

Per effettuare questi due passaggi abbiamo utilizzato l' editor "Vim", che abbiamo installato (dopo aver fatto l' accesso alla CLI del ContainerS da Root User usando il comando sudo docker exec -it ContainerS /bin/bash) con il comando "apt-get install vim".

Sulla macchina host possiamo verificare che Minikube è attivo utilizzando il comando "Minikube status", e nel caso non lo fosse si può far partire con il comando "minikube start". Una volta partito, con il comando "kubectl create namespace formazione-sou" siamo andati a crearci il namespace richiesto.

Poi siamo passati alla Pipeline Jenkins: siamo andati a crearci un nuovo Jenkinsfile, in cui per prima cosa abbiamo effettuato il "clone" della repository di GitHub in cui è contenuto il nostro Helm chart. Poi abbiamo utilizzato il comando "export KUBECONFIG=/.kube/config" per exportare il file Config e il comando "helm upgrade --install" per far partire il nostro Helm Chart. 

Prima di far partire la Pipeline su Jenkins, siamo andati a modificare il vero e proprio Helm Chart, avendolo lasciato "in sospeso" dallo step 3. Siamo andati ad specificare il namespace creato e siamo andati ad inserire l'immagine Docker creata nello step 2 come Container Image da utilizzare per la creazione del Pod.

Dopo aver fatto partire la Pipeline, possiamo andare a verificare l' effettiva creazione del Pod usando il comando "kubectl get pod -n formazione-sou" e possiamo verificare che sia nello stato "running".

Ultima verifica effettuata è stata utilizzare il comando "docker run -p 8000:8000 giosuemanzo/flask-app-example:latest". In questo modo andando su "localhost:8000" (:8000 è la porta specificata nel Dockerfile dello step precedente) viene stampata a video la scritta "Helloworld". 
