From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Jul 2023 13:47:01 +0200
Subject: [PATCH 5/7] RISC-V: KVM: Sort ISA extensions alphabetically in
 ONE_REG interface
In-Reply-To: <20230712161047.1764756-6-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-6-apatel@ventanamicro.com>
Message-ID: <20230713-8e31c6213e0d7359898b7c17@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 09:40:45PM +0530, Anup Patel wrote:
> Let us sort isa extensions alphabetically in kvm_isa_ext_arr[] and
> kvm_riscv_vcpu_isa_disable_allowed() so that future insertions are
> more predictable.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

