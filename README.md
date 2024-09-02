# EPSI---IaC

#### **Contexte :**
Dans cet atelier, vous allez mettre en place une infrastructure cloud en utilisant **Terraform**. L'objectif est de déployer une architecture web sur **Microsoft Azure** (ou sur Docker si Azure n'est pas disponible). L'infrastructure sera composée de deux serveurs web, un serveur de base de données, un réseau virtuel (VNet), trois sous-réseaux, un load balancer pour équilibrer la charge entre les serveurs web, et un storage account pour stocker l'état de Terraform (tfstate). Vous allez organiser ce projet Terraform en utilisant des modules pour favoriser la réutilisabilité et la maintenabilité de votre code.

#### **Objectifs :**
- Apprendre à structurer un projet Terraform avec des modules.
- Déployer une infrastructure complète sur Azure ou Docker.
- Gérer des environnements de déploiement (par exemple, développement et production).
- Configurer un stockage sécurisé pour l'état Terraform.

#### **Énoncé du Projet :**

1. **Structure du Projet Terraform** :
   - Créez un projet Terraform structuré avec les éléments suivants :
     - Un dossier `environments` contenant des configurations pour différents environnements (`dev`, `prod`).
     - Un dossier `modules` pour contenir des modules réutilisables (réseau, compute, stockage, etc.).
     - Un dossier `main` où sera situé le fichier de configuration principal pour orchestrer le déploiement.

2. **Module Réseau** :
   - Créez un module `network` qui :
     - Définit un **réseau virtuel (VNet)**.
     - Crée trois **sous-réseaux** :
       - Un sous-réseau pour les serveurs web.
       - Un sous-réseau pour le serveur de base de données.
       - Un sous-réseau pour un potentiel future service ou sécurité.
     - Configure les **groupes de sécurité réseau (NSG)** pour contrôler le trafic entrant et sortant.

3. **Module Serveurs** :
   - Créez un module `compute` qui :
     - Déploie deux **machines virtuelles (VMs)** pour les serveurs web, sur le sous-réseau dédié.
     - Déploie une **VM pour le serveur de base de données** sur le sous-réseau de base de données.
     - Installe un serveur web (Apache/Nginx) sur les VMs web et configure une simple page web pour tester la connectivité.
     - Installe une base de données (MySQL/PostgreSQL) sur la VM de base de données.

4. **Module Load Balancer** :
   - Créez un module `load_balancer` qui :
     - Crée un **Azure Load Balancer** qui équilibre la charge entre les deux serveurs web.
     - Configure les règles de distribution de charge et les sondes de santé pour vérifier la disponibilité des serveurs web.

5. **Module Stockage** :
   - Créez un module `storage` qui :
     - Crée un **Azure Storage Account** pour stocker le fichier d’état (`terraform.tfstate`) de manière sécurisée.
     - Configure un container dans ce storage account pour le stockage du tfstate.

6. **Configuration de l'Environnement** :
   - Dans le dossier `environments`, créez deux environnements (`dev`, `prod`) avec des fichiers de configuration spécifiques (par exemple, `backend.tf`, `variables.tf`).
   - Le `backend.tf` doit être configuré pour utiliser le storage account créé dans l'étape précédente pour stocker le tfstate.

7. **Déploiement de l'Infrastructure** :
   - Utilisez les modules créés pour déployer l’infrastructure dans les deux environnements (`dev` et `prod`).
   - Effectuez le déploiement en utilisant les commandes Terraform (`terraform init`, `terraform plan`, `terraform apply`).
   - Assurez-vous que le fichier d’état est correctement stocké dans le storage account.

8. **Tests et Validation** :
   - Vérifiez que les serveurs web sont accessibles via le load balancer et affichent la page web prévue.
   - Assurez-vous que le serveur de base de données est accessible depuis les serveurs web, mais pas directement depuis l’extérieur.
   - Testez la résilience en arrêtant un des serveurs web et en observant comment le load balancer redistribue le trafic.

9. **Documentation** :
   - Rédigez une documentation décrivant :
     - La structure du projet.
     - Les modules créés et leur rôle.
     - La configuration des environnements.
     - Les étapes de déploiement.
   - Incluez les instructions pour exécuter les tests de validation et les résultats attendus.

#### **Livrables :**
- Structure complète du projet Terraform avec modules et environnements.
- Configuration Terraform pour le déploiement de l'infrastructure sur Azure ou Docker.
- Documentation détaillée du projet.
