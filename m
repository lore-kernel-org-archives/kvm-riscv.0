From: Xiu Jianfeng <xiujianfeng@huawei.com>
Date: Tue, 20 Sep 2022 21:47:03 +0800
Subject: [PATCH -next] RISC-V: KVM: add __init annotation to riscv_kvm_init()
Message-ID: <20220920134703.132216-1-xiujianfeng@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's module_init entry, add __init annotation to it.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 arch/riscv/kvm/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 1549205fe5fe..df2d8716851f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -122,7 +122,7 @@ void kvm_arch_exit(void)
 {
 }
 
-static int riscv_kvm_init(void)
+static int __init riscv_kvm_init(void)
 {
 	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
-- 
2.17.1


