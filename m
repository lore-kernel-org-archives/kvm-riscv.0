From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Thu,  3 Aug 2023 13:33:02 -0300
Subject: [PATCH v4 10/10] docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
Message-ID: <20230803163302.445167-11-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The EBUSY errno is being used for KVM_SET_ONE_REG as a way to tell
userspace that a given reg can't be changed after the vcpu started.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 Documentation/virt/kvm/api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c0ddd3035462..3249fb56cc69 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2259,6 +2259,8 @@ Errors:
   EINVAL   invalid register ID, or no such register or used with VMs in
            protected virtualization mode on s390
   EPERM    (arm64) register access not allowed before vcpu finalization
+  EBUSY    (riscv) changing register value not allowed after the vcpu
+           has run at least once
   ======   ============================================================
 
 (These error codes are indicative only: do not rely on a specific error
-- 
2.41.0


