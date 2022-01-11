From: Yang Li <yang.lee@linux.alibaba.com>
Date: Tue, 11 Jan 2022 09:04:54 +0800
Subject: [PATCH -next] RISC-V: KVM: remove unneeded semicolon
Message-ID: <20220111010454.126241-1-yang.lee@linux.alibaba.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Eliminate the following coccicheck warning:
./arch/riscv/kvm/vcpu_sbi_v01.c:117:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/riscv/kvm/vcpu_sbi_v01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 4c7e13ec9ccc..9acc8fa21d1f 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -114,7 +114,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	default:
 		ret = -EINVAL;
 		break;
-	};
+	}
 
 	return ret;
 }
-- 
2.20.1.7.g153144c


