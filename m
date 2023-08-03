From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Thu, 3 Aug 2023 11:56:32 -0300
Subject: [PATCH v3 00/10] RISC-V: KVM: change get_reg/set_reg error codes
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
Message-ID: <b7ac5ba8-63f0-ca47-aa64-cb634e0fb33b@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/3/23 11:00, Daniel Henrique Barboza wrote:
> Hi,
> 
> This version has changes in the document patch, as suggested by Andrew
> in v2. It also has a new patch (patch 9) that handles error code changes
> in vcpu_vector.c.

I forgot to include a diff that Andrew mentioned in his v2 review:


diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c88b0c7f7f01..6ca90c04ba61 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -506,7 +506,7 @@ static int riscv_vcpu_get_isa_ext_multi(struct kvm_vcpu *vcpu,
         unsigned long i, ext_id, ext_val;

         if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
-               return -EINVAL;
+               return -ENOENT;

         for (i = 0; i < BITS_PER_LONG; i++) {
                 ext_id = i + reg_num * BITS_PER_LONG;
@@ -529,7 +529,7 @@ static int riscv_vcpu_set_isa_ext_multi(struct kvm_vcpu *vcpu,
         unsigned long i, ext_id;

         if (reg_num > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
-               return -EINVAL;
+               return -ENOENT;

         for_each_set_bit(i, &reg_val, BITS_PER_LONG) {
                 ext_id = i + reg_num * BITS_PER_LONG;
@@ -644,7 +644,7 @@ int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
                 break;
         }

-       return -EINVAL;
+       return -ENOENT;
  }

  int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,


I'll send a v4 including it. Thanks,


Daniel


> 
> Patches rebased on top of kvm_riscv_queue.
> 
> Changes from v2:
> - patch 9 (new):
>    - change kvm error codes for vector registers
> - patch 10 (former 9):
>    - rewrite EBUSY doc to mention that the error code indicates that it
>      is not allowed to change the reg val after the vcpu started.
> - v2 link: https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza at ventanamicro.com/
> 
> Andrew Jones (1):
>    RISC-V: KVM: Improve vector save/restore errors
> 
> Daniel Henrique Barboza (9):
>    RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
>    RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
>    RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
>    RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
>    RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
>    RISC-V: KVM: avoid EBUSY when writing same ISA val
>    RISC-V: KVM: avoid EBUSY when writing the same machine ID val
>    RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
>    docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
> 
>   Documentation/virt/kvm/api.rst |  2 +
>   arch/riscv/kvm/aia.c           |  4 +-
>   arch/riscv/kvm/vcpu_fp.c       | 12 +++---
>   arch/riscv/kvm/vcpu_onereg.c   | 68 +++++++++++++++++++++++-----------
>   arch/riscv/kvm/vcpu_sbi.c      | 16 ++++----
>   arch/riscv/kvm/vcpu_timer.c    | 11 +++---
>   arch/riscv/kvm/vcpu_vector.c   | 60 ++++++++++++++++--------------
>   7 files changed, 104 insertions(+), 69 deletions(-)
> 

