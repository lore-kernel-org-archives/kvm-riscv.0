From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 3 Apr 2023 14:00:48 +0200
Subject: [PATCH v3 4/8] RISC-V: KVM: Initial skeletal support for AIA
In-Reply-To: <20230403093310.2271142-5-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-5-apatel@ventanamicro.com>
Message-ID: <3v5mew46z4kfa3kq4c5gdx72k7qh35qtk3tez26jthnbuygf2t@zy2lukq75ugv>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 03:03:06PM +0530, Anup Patel wrote:
> To incrementally implement AIA support, we first add minimal skeletal
> support which only compiles and detects AIA hardware support at the
> boot-time but does not provide any functionality.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h    |   6 ++
>  arch/riscv/include/asm/kvm_aia.h  | 109 ++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h |   7 ++
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/aia.c              |  66 ++++++++++++++++++
>  arch/riscv/kvm/main.c             |  22 +++++-
>  arch/riscv/kvm/vcpu.c             |  40 ++++++++++-
>  arch/riscv/kvm/vcpu_insn.c        |   1 +
>  arch/riscv/kvm/vm.c               |   4 ++
>  9 files changed, 252 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_aia.h
>  create mode 100644 arch/riscv/kvm/aia.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

