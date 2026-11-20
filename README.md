# Docker AI Homelab

> ⚡ **Self-hosted AI on your own hardware**

Complete AI infrastructure stack for running LLMs, embeddings, and AI applications at home. Designed for a RTX 4090 or dual RTX 3090 setup.

---

## 📊 What's Inside

| Service | Port | GPU | Purpose |
|---------|------|-----|---------|
| Ollama | 11434 | ✅ | LLM inference (Mistral, Llama, Phi) |
| Qdrant | 6333 | - | Vector database (embeddings) |
| MinIO | 9000 / 9001 | - | S3-compatible storage (models, data) |
| Dify | 3000 | ✅ | AI workflow platform + UI |
| n8n | 5678 | - | Workflow automation |
| Prometheus | 9090 | - | Metrics (from Ollama, Dify, etc.) |
| Grafana | 3001 | - | Visualization + dashboards |
| Traefik | 80 / 443 | - | Reverse proxy + SSL (Caddy alternative) |

---

## 🚀 Quick Start

### Prerequisites
- NVIDIA GPU (RTX 4090 recommended, 24GB VRAM)
- NVIDIA Container Toolkit installed
- Docker + Docker Compose
- 64GB RAM (minimum), 128GB (recommended)

### Start

```bash
# Clone and customize for your GPU
git clone https://github.com/tobias-weiss-ai-xr/docker-ai-homelab.git
cd docker-ai-homelab

# Edit .env to set your GPU model
nano .env

# Start everything
docker compose up -d

# Access:
# Dify AI:   https://ai.localhost
# n8n:       https://n8n.localhost
# Ollama:    http://localhost:11434
# MinIO:     http://localhost:9001 (minioadmin/minioadmin)
# Grafana:   http://localhost:3001 (admin/admin)
```

---

## ✅ Pre-Configured

- ✅ **Ollama** with version-pinned CUDA runtime
- ✅ **Dify** with local model support +,**Pre-configured** system prompts
- ✅ **n8n** with AI workflow templates
- ✅ **MinIO** buckets for models, embeddings, and uploads
- ✅ **Traefik** with automatic SSL via Let's Encrypt
- ✅ **Grafana dashboards** for GPU monitoring

---

## 💡 Production blueprint available

This free template gives you **the infrastructure**.

For **production AI deployment**, you need:
- ✅ Load balancing across multiple GPUs
- ✅ Model quantization + serving optimization
- ✅ Embedding pipeline with batching
- ✅ Token limit management + rotation
- ✅ Prompt caching for cost reduction
- ✅ Scaling strategies (multi-GPU, multi-node)
- ✅ Backup strategy for models + data

**🔗 Get the complete homelab guide:**
📖 [AI Infrastructure Mastery →](https://graphwiz.ai/store/ai-infrastructure-mastery) (€29)

> **This is the exact blueprint** we run at graphwiz.ai, with 250+ pages of production know-how.

---

## 🔧 Customization

### Use Different Models
```bash
# Pull any model
curl http://localhost:11434/api/pull -d '{"name": "llama3.2:70b"}'

# Or use cloud models (add API key to .env)
ollarma pull --cloud grok-2
```

### Add More GPUs
Edit `docker-compose.yml` to spread services across GPUs using CUDA_VISIBLE_DEVICES.

### Change Storage Backend
Swap MinIO for S3, Azure Blob, or local filesystem.

---

## 📚 Resources from graphwiz.ai

- [AI Homelab Guide](https://graphwiz.ai/content/ai/self-hosted-ai-infrastructure)
- [DGX Spark Cluster Blueprint](https://graphwiz.ai/store/dgx-spark-cluster-blueprint) - Multi-GPU setup
- [DGX Spark Qwen3 27B Recipe](https://graphwiz.ai/store/dgx-spark-qwen3-27b-recipe) - Ready-to-deploy

---

## 🎯 Use Cases

- **Local AI assistant** for your team
- **Semantic search** over your documents
- **Chatbot** for your website / app
- **Text generation** API for your products
- **AI-powered workflows** with n8n
- **Experiment** with open source models

---

## ⚠️ Requirements

| Hardware | Minimum | Recommended |
|----------|---------|-------------|
| GPU | RTX 3060 (12GB) | RTX 4090 / RTX 3090 x2 |
| RAM | 32GB | 128GB |
| Storage | 50GB SSD | 500GB NVMe + HDD for models |
| Bandwidth | 100 Mbps | 1 Gbps |

### Model Memory Requirements
| Model | VRAM | RAM (CPU offload) |
|-------|------|-------------------|
| Llama 3.2 3B | 6GB | 8GB |
| Llama 3.2 8B | 16GB | 16GB |
| Llama 3.2 70B | 78GB | 64GB (with offload) |
| Mistral 7B | 14GB | 16GB |

---

## 💬 Community

- **Questions?** Open an issue on this repo
- **Need commercial help?** [Tobias Weiss IT-Services](https://tobias-weiss.org)
- **More templates?** [graphwiz.ai/store](https://graphwiz.ai/store)

---

## 📄 License

MIT License - Free for personal and commercial use.

© 2026 Tobias Weiss IT-Services
