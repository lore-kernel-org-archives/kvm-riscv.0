From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed,  6 Dec 2023 18:02:45 +0100
Subject: [PATCH 3/5] KVM: selftests: riscv: Remove redundant newlines
In-Reply-To: <20231206170241.82801-7-ajones@ventanamicro.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com>
Message-ID: <20231206170241.82801-10-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

TEST_* functions append their own newline. Remove newlines from
TEST_* callsites to avoid extra newlines in output.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
 tools/testing/selftests/kvm/riscv/get-reg-list.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..b3082da05c76 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -327,7 +327,7 @@ void vcpu_args_set(struct kvm_vcpu *vcpu, unsigned int num, ...)
 	int i;
 
 	TEST_ASSERT(num >= 1 && num <= 8, "Unsupported number of args,\n"
-		    "  num: %u\n", num);
+		    "  num: %u", num);
 
 	va_start(ap, num);
 
diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 6bedaea95395..4355e33c0cec 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -112,7 +112,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 
 		/* Double check whether the desired extension was enabled */
 		__TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
-			       "%s not available, skipping tests\n", s->name);
+			       "%s not available, skipping tests", s->name);
 	}
 }
 
-- 
2.43.0


