
# Step. 6
Lo scopo di questo esercizio è quello di equipaggiare l'istanza Kubernetes di un Ingress Controller Nginx, facendo in modo che l'Helm Chart installi anche l'ingress nginx.
Chiamando via HTTP http://formazionesou.local bisogna ottenere "hello world", ovvero quanto esposto dall'applicazione Flask creata nei punti precedenti.

Dopo aver terminato lo step 4, andando sul Browser del computer locale su "http://localhost:8000" riuscivamo ad avere la stampa a video della scritta "Helloworld", il tutto dall' interno del Cluster.

Per avere lo stesso risultato fuori dal Cluster siamo andati a modificare il Chart: per prima cosa nel file Values.yaml abbiamo modificato il service da ClusterIp (il quale permette solamente la comunicazione interna al Cluster) a NodePort (il quale mantiene una porta statica per la comunicazione esterna). Per configurare il NodePort è stata scelta la porta 31000, che è stata specificata nel file service.yaml. 

Tornando al file Values.yaml siamo andati ad aggiungere un ingress che ci permettesse la comunicazione con l'esterno. Lo abbiamo pertanto attivato e abbiamo aggiunto l' host "formazionesou.local", che sarà il sito su cui dovremo vedere la scritta "Helloworld".

Dopo aver terminato la modifica del Chart, per convenzione abbiamo cancellato e ricreato il NameSpace "formazione-sou", per poi far partire nuovamente la Pipeline jenkins, andando ad installare il Chart modificato.

Successivamente abbiamo utilizzato il comando "minikube addons enable ingress" dal computer locale per abilitare il controller ingress.

Ultimo step è stato l' andarci a modificare il file /etc/hosts nel computer locale. Questo file funge da DNS, infatti siamo andati ad aggiungere l' ip di Minikube e l' indirizzo richiesto dalla traccia. In questo modo, per effettuare la verifica della riuscita dell' esercizio, siamo andati sul browser del nostro pc e abbiamo chiamato la pagina http://formazionesou.local, la quale ci ha restituito la scritta "Helloworld".