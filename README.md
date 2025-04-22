# Challenge_3SEM 

## 🔄 Projeto: Sistema de Gestão de Pátio Mottu – Web + Mobile
### 🎯 Objetivo do Projeto
Desenvolver uma plataforma integrada para gestão e visualização da posição das motos nos pátios da Mottu, acessível tanto via navegador (versão web) quanto em smartphones (versão mobile), com possibilidades futuras de integração com visão computacional, IoT e sensores físicos.

### 🧩 Funcionalidade Central (MVP)
✅ Cadastro e edição de motos
✅ Registro de entrada e saída de motos no pátio
✅ Alocação manual das motos em posições pré-definidas
✅ Visualização do layout do pátio em um mapa simbólico
✅ Histórico e relatórios simples
✅ Alertas manuais (ex: moto não movimentada há 7 dias)

### 🌐 Versão Web
Usuários: Administradores, supervisores, equipe de planejamento
Funcionalidades específicas:
Painel administrativo com CRUD de motos, operadores e pátios
Visualização completa do pátio em grade ou mapa ilustrativo
Relatórios e filtros mais completos
Gerenciamento de permissões

### 📱 Versão Mobile (React Native)
Usuários: Operadores que trabalham diretamente no pátio
Funcionalidades específicas:
Check-in/check-out rápido de motos
Escolha de posição da moto no pátio via lista ou grade simplificada
Acompanhamento básico do status do pátio
Interface otimizada para toque, com menos campos e navegação direta

### 🧱 Tecnologias Sugeridas
Frontend Web: Next.js ou React.js + Tailwind CSS
Mobile: React Native (Expo para facilitar)
Backend: Node.js (Express) ou Firebase Functions
Banco de Dados: Firebase, Supabase ou PostgreSQL
Hospedagem: Vercel (Web) + Expo Go ou APK (Mobile)
Autenticação: Firebase Auth ou JWT

### 🧠 Visão de Futuro: Evolução do Projeto
Depois que você tiver as disciplinas de IoT e Visão Computacional, você pode:
Integrar leitura de QR Code ou RFID nas motos
Usar câmeras com OpenCV para identificar e localizar motos automaticamente
Implantar sensores nos espaços do pátio e rastrear posições automaticamente
Implementar um mini dashboard em tempo real com movimentações ao vivo
