From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
Subject: [PATCH v7 00/16] Add support for a few Zc* extensions,
 Zcmop and Zimop
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
Message-ID: <171951065638.6762.17635047001193885957.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 19 Jun 2024 13:35:10 +0200 you wrote:
> Add support for (yet again) more RVA23U64 missing extensions. Add
> support for Zimop, Zcmop, Zca, Zcf, Zcd and Zcb extensions ISA string
> parsing, hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have
> been left out since they target microcontrollers/embedded CPUs and are
> not needed by RVA23U64.
> 
> Since Zc* extensions states that C implies Zca, Zcf (if F and RV32), Zcd
> (if D), this series modifies the way ISA string is parsed and now does
> it in two phases. First one parses the string and the second one
> validates it for the final ISA description.
> 
> [...]

Here is the summary with links:
  - [v7,01/16] dt-bindings: riscv: add Zimop ISA extension description
    https://git.kernel.org/riscv/c/a57b68bc315c
  - [v7,02/16] riscv: add ISA extension parsing for Zimop
    https://git.kernel.org/riscv/c/2467c2104f1f
  - [v7,03/16] riscv: hwprobe: export Zimop ISA extension
    https://git.kernel.org/riscv/c/36f8960de887
  - [v7,04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
    https://git.kernel.org/riscv/c/fb2a3d63efef
  - [v7,05/16] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
    https://git.kernel.org/riscv/c/ca5446406914
  - [v7,06/16] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
    https://git.kernel.org/riscv/c/e9f9946cad7b
  - [v7,07/16] riscv: add ISA extensions validation callback
    https://git.kernel.org/riscv/c/625034abd52a
  - [v7,08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
    https://git.kernel.org/riscv/c/ba4cd855839d
  - [v7,09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
    https://git.kernel.org/riscv/c/0ad70db5eb21
  - [v7,10/16] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
    https://git.kernel.org/riscv/c/d964e8f2ae65
  - [v7,11/16] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
    https://git.kernel.org/riscv/c/d27c34a73514
  - [v7,12/16] dt-bindings: riscv: add Zcmop ISA extension description
    https://git.kernel.org/riscv/c/700556a73bc7
  - [v7,13/16] riscv: add ISA extension parsing for Zcmop
    https://git.kernel.org/riscv/c/164d644059cf
  - [v7,14/16] riscv: hwprobe: export Zcmop ISA extension
    https://git.kernel.org/riscv/c/fc078ea317cc
  - [v7,15/16] RISC-V: KVM: Allow Zcmop extension for Guest/VM
    https://git.kernel.org/riscv/c/29cf9b803e6e
  - [v7,16/16] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
    https://git.kernel.org/riscv/c/e212d92d1a86

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



