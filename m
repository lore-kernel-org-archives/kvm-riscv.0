From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 20 Oct 2023 10:13:41 +0200
Subject: [PATCH v3 3/9] RISC-V: KVM: Allow some SBI extensions to be
 disabled by default
In-Reply-To: <20231020072140.900967-4-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-4-apatel@ventanamicro.com>
Message-ID: <20231020-622a7f510c98e8c82135e6fc@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 20, 2023 at 12:51:34PM +0530, Anup Patel wrote:
> Currently, all SBI extensions are enabled by default which is
> problematic for SBI extensions (such as DBCN) which are forwarded
> to the KVM user-space because we might have an older KVM user-space
> which is not aware/ready to handle newer SBI extensions. Ideally,
> the SBI extensions forwarded to the KVM user-space must be
> disabled by default.
> 
> To address above, we allow certain SBI extensions to be disabled
> by default so that KVM user-space must explicitly enable such
> SBI extensions to receive forwarded calls from Guest VCPU.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++
>  arch/riscv/kvm/vcpu.c                 |  6 +++
>  arch/riscv/kvm/vcpu_sbi.c             | 57 +++++++++++++--------------
>  3 files changed, 38 insertions(+), 29 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

