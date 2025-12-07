# SwiftUI – Diferença prática entre **Struct** e **Class**

Este repositório demonstra de forma **simples, clara e real** como usar **struct** e **class** no desenvolvimento de um app iOS com SwiftUI.

A estrutura do projeto foi organizada exatamente para deixar explícito:

* Onde você normalmente usa **struct** (Model, App, Views)
* Onde você usa **class** (ViewModel, Services)
* Como isso se conecta em um fluxo **real** baseado em SwiftUI + MVVM

---

## 📁 Estrutura do Projeto

A organização do Xcode foi feita para destacar a diferença entre **Struct** e **Class**:

```
StructAndClass
 └── StructAndClass
      ├── Struct
      │    ├── UserProfile.swift      (Model - struct) 
      │    ├── MyApp.swift            (App principal - struct)
      │    └── ProfileView.swift      (View - struct)
      ├── Class
      │    ├── UserService.swift      (Service - class)
      │    └── ProfileViewModel.swift (ViewModel - class)
      ├── Assets
      └── Preview Content
```

Essa estrutura mostra exatamente como SwiftUI e MVVM funcionam na prática:

| Pasta  | Tipo   | Arquivo              | Uso típico                                              |
| ------ | ------ | -------------------- | ------------------------------------------------------- |
| Struct | struct | Modelos e App        | Dados imutáveis, estado simples, performance, segurança |
| Class  | class  | ViewModel e Serviços | Estado mutável, ciclo de vida único, ObservableObject   |
| Views  | struct | UI do app (SwiftUI)  | Representação do estado, leve e declarativa             |

---

## 🧩 Implementação Completa

### **Model (struct)** – `UserProfile.swift`

```swift
struct UserProfile: Codable, Identifiable {
    let id: UUID
    let name: String
    let avatarURL: URL
}
```

---

### **Service (class)** – `UserService.swift`

```swift
class UserService {
    func fetchProfile() async throws -> UserProfile {
        try await Task.sleep(nanoseconds: 500_000_000)
        return UserProfile(
            id: UUID(),
            name: "Eder Oliveira",
            avatarURL: URL(string: "https://example.com/avatar.png")!
        )
    }
}
```

---

### **ViewModel (class)** – `ProfileViewModel.swift`

```swift
class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile?

    private let service: UserService

    init(service: UserService) {
        self.service = service
    }

    func load() async {
        profile = try? await service.fetchProfile()
    }
}
```

---

### **View (struct)** – `ProfileView.swift`

```swift
import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(spacing: 16) {
            if let profile = viewModel.profile {
                Text("Olá, \(profile.name)")
                    .font(.title)
            } else {
                ProgressView("Carregando...")
            }
        }
        .padding()
        .task {
            await viewModel.load()
        }
    }
}
```

---

### **App Entry (struct)** – `MyApp.swift`

```swift
import SwiftUI

@main
struct MyApp: App {

    private let userService = UserService()
    private lazy var profileViewModel = ProfileViewModel(service: userService)

    var body: some Scene {
        WindowGroup {
            ProfileView(viewModel: profileViewModel)
        }
    }
}
```

---

## 🎯 Objetivo do Projeto

Este exemplo existe para demonstrar claramente:

* Quando se usa **struct** em SwiftUI
* Quando se usa **class** (ViewModels, Services)
* Como essas duas abordagens se complementam no MVVM
* Como organizar um projeto real de forma limpa e didática

É um ótimo ponto de partida para quem está aprendendo SwiftUI, MVVM, arquitetura limpa e modularização.

---

## 🚀 Como Rodar

1. Abra o projeto no **Xcode 15 ou superior**
2. Selecione um simulador
3. Rode o app
4. A tela carregará um perfil mockado

---

## 📄 Licença

Livre para estudo, testes e uso pessoal.
