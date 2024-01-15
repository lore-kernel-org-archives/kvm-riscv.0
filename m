From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Jan 2024 16:41:08 +0100
Subject: [PATCH 06/15] RISC-V: KVM: Allow vector crypto extensions for
 Guest/VM
In-Reply-To: <20231128145357.413321-7-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-7-apatel@ventanamicro.com>
Message-ID: <20240115-99866622cb962823aa8a4d47@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 28, 2023 at 08:23:48PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable vector crypto extensions for
> Guest/VM. This includes extensions Zvbb, Zvbc, Zvkb, Zvkg,
> Zvkned, Zvknha, Zvknhb, Zvksed, Zvksh, and Zvkt.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 10 ++++++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 20 ++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

