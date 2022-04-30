From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sat, 30 Apr 2022 21:11:20 +0200
Subject: [PATCH] RISC-V: fix typos in comments
Message-ID: <20220430191122.8667-6-Julia.Lawall@inria.fr>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/riscv/kvm/vmid.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 2fa4f7b1813d..4a2178c60b5d 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
 		 * We ran out of VMIDs so we increment vmid_version and
 		 * start assigning VMIDs from 1.
 		 *
-		 * This also means existing VMIDs assignement to all Guest
+		 * This also means existing VMIDs assignment to all Guest
 		 * instances is invalid and we have force VMID re-assignement
 		 * for all Guest instances. The Guest instances that were not
 		 * running will automatically pick-up new VMIDs because will


