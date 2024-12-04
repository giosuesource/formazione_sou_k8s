
# Step. 3
Lo scopo di questo esercizio è quello di creare un Helm Chart (utilizzando helm init) custom, che effettui il deploy dell'immagine creata tramite la pipeline flask-app-example-build. In input deve essere possibile specificare quale tag rilasciare. 

In questo step viene semplicemente creato un helm chart utilizzando il comando "helm init". 

Lo stesso verrà modificato successivamente, in quanto per verificarne la correttezza è necessario utilizzare la Pipeline Jenkins richiesta dallo step 4.