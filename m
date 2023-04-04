From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 4 Apr 2023 18:31:35 +0200
Subject: [PATCH v4 8/9] RISC-V: KVM: Virtualize per-HART AIA CSRs
In-Reply-To: <20230404153452.2405681-9-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-9-apatel@ventanamicro.com>
Message-ID: <nlvhpt27vgfb5huoexrv2xs7yeq4hdd3fna4yozfb4nvi6s3ky@5srurtxs3cjy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 04, 2023 at 09:04:51PM +0530, Anup Patel wrote:
> The AIA specification introduce per-HART AIA CSRs which primarily
> support:
> * 64 local interrupts on both RV64 and RV32
> * priority for each of the 64 local interrupts
> * interrupt filtering for local interrupts
> 
> This patch virtualize above mentioned AIA CSRs and also extend
> ONE_REG interface to allow user-space save/restore Guest/VM
> view of these CSRs.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_aia.h  |  88 ++++----
>  arch/riscv/include/uapi/asm/kvm.h |   7 +
>  arch/riscv/kvm/aia.c              | 322 ++++++++++++++++++++++++++++++
>  3 files changed, 382 insertions(+), 35 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

