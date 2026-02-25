# Day 32 — Docker Volumes & Networking

## 📌 Objective

Learn how Docker handles **data persistence** and **container communication** using:

- Named volumes
- Bind mounts
- Docker networks

---

## 📂 Expected Output

- Markdown file: `day-32-volumes-networking.md`
- Screenshots of experiments (attach below each task)

---

## 🧪 Task 1: The Problem (Data Loss Without Volumes)

### Steps

1. Run a Postgres container:

```bash
docker run -d --name pg-test -e POSTGRES_PASSWORD=pass postgres
```

2. Create sample data:

```bash
docker exec -it pg-test psql -U postgres
CREATE TABLE demo(id INT, name TEXT);
INSERT INTO demo VALUES (1, 'test');
SELECT * FROM demo;
```

3. Stop and remove container:

```bash
docker stop pg-test
docker rm pg-test
```

4. Run a new container:

```bash
docker run -d --name pg-test -e POSTGRES_PASSWORD=pass postgres
```

### Result

❌ Data is **lost**.

### Why?

Docker containers are **ephemeral**. All data stored inside the container filesystem is removed when the container is deleted.

📸 _Add Screenshot Here_

---

## 🧪 Task 2: Named Volumes (Persistent Storage)

### Step 1: Create Volume

```bash
docker volume create pg-data
```

### Step 2: Run Container with Volume

```bash
docker run -d \
  --name pg-vol \
  -e POSTGRES_PASSWORD=pass \
  -v pg-data:/var/lib/postgresql/data \
  postgres
```

### Step 3: Add Data

```bash
docker exec -it pg-vol psql -U postgres
CREATE TABLE demo(id INT, name TEXT);
INSERT INTO demo VALUES (1, 'persistent');
```

### Step 4: Remove Container

```bash
docker stop pg-vol
docker rm pg-vol
```

### Step 5: Run New Container with Same Volume

```bash
docker run -d \
  --name pg-vol2 \
  -e POSTGRES_PASSWORD=pass \
  -v pg-data:/var/lib/postgresql/data \
  postgres
```

### Verification

```bash
docker volume ls
docker volume inspect pg-data
```

### Result

✅ Data **persists** even after container removal.

📸 _Add Screenshot Here_

---

## 🧪 Task 3: Bind Mounts (Live File Sync)

### Step 1: Create Host Folder

```bash
mkdir site
cd site
echo "<h1>Hello from Host</h1>" > index.html
```

### Step 2: Run Nginx with Bind Mount

```bash
docker run -d -p 8080:80 \
  --name nginx-bind \
  -v $(pwd):/usr/share/nginx/html \
  nginx
```

### Step 3: Open Browser

Visit: [http://localhost:8080](http://localhost:8080)

### Step 4: Edit File on Host

```bash
echo "<h1>Updated from Host</h1>" > index.html
```

Refresh browser → changes appear instantly.

### Named Volume vs Bind Mount

| Feature           | Named Volume | Bind Mount  |
| ----------------- | ------------ | ----------- |
| Managed by Docker | ✅ Yes       | ❌ No       |
| Host visibility   | Limited      | Full access |
| Portability       | High         | Low         |
| Real-time editing | ❌ No        | ✅ Yes      |

📸 _Add Screenshot Here_

---

## 🌐 Task 4: Docker Networking Basics

### Step 1: List Networks

```bash
docker network ls
```

### Step 2: Inspect Bridge Network

```bash
docker network inspect bridge
```

### Step 3: Run Two Containers

```bash
docker run -dit --name c1 alpine sh
docker run -dit --name c2 alpine sh
```

### Ping by Name

```bash
docker exec c1 ping c2
```

❌ Usually fails (default bridge lacks automatic DNS resolution).

### Ping by IP

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' c2
```

```bash
docker exec c1 ping <IP>
```

✅ Works

📸 _Add Screenshot Here_

---

## 🌐 Task 5: Custom Networks

### Step 1: Create Network

```bash
docker network create my-app-net
```

### Step 2: Run Containers on Network

```bash
docker run -dit --name net1 --network my-app-net alpine sh
docker run -dit --name net2 --network my-app-net alpine sh
```

### Ping by Name

```bash
docker exec net1 ping net2
```

✅ Works!

### Why It Works

Custom bridge networks include:

- Built-in DNS resolution
- Container name-based discovery
- Better isolation

📸 _Add Screenshot Here_

---

## 🔗 Task 6: Putting It All Together

### Step 1: Create Network

```bash
docker network create app-net
```

### Step 2: Run Database with Volume

```bash
docker volume create db-data

docker run -d \
  --name mysql-db \
  --network app-net \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=testdb \
  -v db-data:/var/lib/mysql \
  mysql
```

### Step 3: Run App Container

```bash
docker run -dit --name app --network app-net alpine sh
```

### Step 4: Test Connectivity

```bash
docker exec app ping mysql-db
```

✅ App container can reach DB using container name.

📸 _Add Screenshot Here_

---

## 🧠 Key Learnings

- Containers are **stateless by default**.
- Use **named volumes** for persistent production data.
- Use **bind mounts** for development and live editing.
- Default bridge network has limited DNS support.
- Custom networks enable **service discovery by name**.

---

## 🏁 Conclusion

This assignment demonstrated how Docker manages:

- Data persistence using volumes
- Host-container file sharing via bind mounts
- Container communication using custom networks

These concepts are essential for building real-world containerized applications and microservices architectures..
