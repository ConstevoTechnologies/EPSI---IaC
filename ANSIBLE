#### **Contexte**

Suite à la mise en place d'une infrastructure sur Azure via Terraform, composée de deux serveurs web, un serveur de base de données, un réseau virtuel avec trois sous-réseaux, un Load Balancer, et un Storage Account pour le stockage de l'état Terraform, vous allez maintenant utiliser Ansible pour configurer les serveurs de manière automatisée.

**Infrastructure existante :**
- **Deux serveurs web** : Hébergeront une application web.
- **Un serveur de base de données** : Hébergera une base de données MySQL.
- **Load Balancer** : Répartit le trafic entre les deux serveurs web.
- **Réseau Virtuel et Sous-Réseaux** : Les serveurs sont isolés dans des sous-réseaux spécifiques (un pour les serveurs web, un pour la base de données).
- **Storage Account** : Stocke l'état Terraform.

#### **Objectifs de l'Atelier**

Dans cet atelier, vous allez :

1. **Configurer les serveurs web** pour :
   - Installer et configurer un serveur web (Nginx ou Apache).
   - Déployer une application web simple sur chaque serveur.
   - Configurer les serveurs pour communiquer avec le serveur de base de données.

2. **Configurer le serveur de base de données** pour :
   - Installer MySQL.
   - Créer une base de données.
   - Configurer les accès depuis les serveurs web.

3. **Mettre en place des playbooks Ansible** pour :
   - Automatiser l'installation et la configuration des logiciels sur chaque serveur.
   - Gérer les configurations de manière déclarative.
   - Assurer l'idempotence (répétition sans changement supplémentaire).

#### **Détails Techniques**

1. **Accès aux Serveurs**
   - Vous avez les adresses IP privées des serveurs web et du serveur de base de données.
   - Utilisez SSH pour vous connecter aux serveurs via Ansible.

2. **Ressources Ansible à Créer**
   - **Inventory File** (`inventory.yml`): Contenant les informations sur les hôtes.
   - **Playbooks**:
     - **`web.yml`** : Pour la configuration des serveurs web.
     - **`db.yml`** : Pour la configuration du serveur de base de données.
   - **Roles** :
     - **`web`** : Pour la gestion de la configuration des serveurs web.
     - **`db`** : Pour la gestion de la configuration du serveur de base de données.
   - **Templates** : Pour la configuration personnalisée (par exemple, le fichier de configuration MySQL ou le fichier de configuration de Nginx/Apache).

#### **Instructions**

1. **Création de l'Inventory File**
   - Créez un fichier `inventory.yml` qui liste les serveurs web et le serveur de base de données. Divisez-les en groupes [webservers] et [dbservers].

   Exemple :
   ```yaml
   all:
     children:
       webservers:
         hosts:
           web1:
             ansible_host: <IP_PRIVEE_WEB1>
           web2:
             ansible_host: <IP_PRIVEE_WEB2>
       dbservers:
         hosts:
           db1:
             ansible_host: <IP_PRIVEE_DB>
   ```

2. **Création des Playbooks**
   - **`web.yml`** : Ce playbook installera Nginx ou Apache, déploiera l’application web et configurera les paramètres nécessaires.

   Exemple :
   ```yaml
   ---
   - name: Configure Web Servers
     hosts: webservers
     become: yes
     roles:
       - web
   ```

   - **`db.yml`** : Ce playbook installera MySQL, créera la base de données et configurera les utilisateurs.

   Exemple :
   ```yaml
   ---
   - name: Configure Database Server
     hosts: dbservers
     become: yes
     roles:
       - db
   ```

3. **Création des Rôles**
   - **Rôle `web`** : Inclura les tâches pour installer et configurer Nginx ou Apache, déployer l’application web et configurer les accès au serveur de base de données.
   - **Rôle `db`** : Inclura les tâches pour installer MySQL, créer une base de données, et configurer les accès.

4. **Test et Validation**
   - Appliquez les playbooks Ansible pour configurer les serveurs web et le serveur de base de données.
   - Vérifiez que les serveurs web sont accessibles via le Load Balancer et qu’ils peuvent interagir avec la base de données.

5. **Documentation**
   - Rédigez un document expliquant les étapes réalisées, incluant les configurations spécifiques, les challenges rencontrés et comment ils ont été résolus.
