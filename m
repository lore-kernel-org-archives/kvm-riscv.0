From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Apr 2022 18:32:57 -0700
Subject: [PATCH 1/2] RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
In-Reply-To: <20220420013258.3639264-1-atishp@rivosinc.com>
References: <20220420013258.3639264-1-atishp@rivosinc.com>
Message-ID: <20220420013258.3639264-2-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
enabled. But it should not appear in the ISA extension in the device tree.

Remove those from the allowed ISA extension for kvm.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6785aef4cbd4..2e25a7b83a1b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -43,9 +43,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 				 riscv_isa_extension_mask(d) | \
 				 riscv_isa_extension_mask(f) | \
 				 riscv_isa_extension_mask(i) | \
-				 riscv_isa_extension_mask(m) | \
-				 riscv_isa_extension_mask(s) | \
-				 riscv_isa_extension_mask(u))
+				 riscv_isa_extension_mask(m))
 
 static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 {
-- 
2.25.1


