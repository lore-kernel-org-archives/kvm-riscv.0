From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 30 Nov 2023 19:35:40 +0100
Subject: [PATCH 2/6] KVM: riscv: selftests: Drop SBI multi registers
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
Message-ID: <20231130183537.55203-10-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These registers are no longer getting added to get-reg-list.
We keep sbi_ext_multi_id_to_str() for printing, even though
we don't expect it to normally be used, because it may be
useful for debug.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 3ae919469c38..42c6244c8d6d 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -623,8 +623,6 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_EN | 0,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_MULTI_DIS | 0,
 };
 
 /*
-- 
2.43.0


