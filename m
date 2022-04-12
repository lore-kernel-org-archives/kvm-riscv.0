From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 Apr 2022 15:37:10 +0530
Subject: [PATCH 3/6] RISC-V: KVM: Treat SBI HFENCE calls as NOPs
In-Reply-To: <20220412100713.1415094-1-apatel@ventanamicro.com>
References: <20220412100713.1415094-1-apatel@ventanamicro.com>
Message-ID: <20220412100713.1415094-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should treat SBI HFENCE calls as NOPs until nested virtualization
is supported by KVM RISC-V. This will help us test booting a hypervisor
under KVM RISC-V.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 0f217365c287..3c1dcd38358e 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -117,7 +117,11 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
-	/* TODO: implement for nested hypervisor case */
+		/*
+		 * Until nested virtualization is implemented, the
+		 * SBI HFENCE calls should be treated as NOPs
+		 */
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 	}
-- 
2.25.1


