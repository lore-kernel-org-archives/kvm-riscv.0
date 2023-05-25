From: Haibo Xu <haibo1.xu@intel.com>
Date: Thu, 25 May 2023 15:38:26 +0800
Subject: [PATCH v2 02/11] KVM: arm64: selftests: Drop SVE cap check in print_reg
In-Reply-To: <cover.1684999824.git.haibo1.xu@intel.com>
References: <cover.1684999824.git.haibo1.xu@intel.com>
Message-ID: <259df68b544dd7254fe4a65be8f39e9d766ac6da.1684999824.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

The check doesn't prove much anyway, as the reg lists could be
messed up too. Just drop the check to simplify making print_reg
more independent.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../testing/selftests/kvm/aarch64/get-reg-list.c  | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/get-reg-list.c b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
index c152523a5ed4..915272c342f9 100644
--- a/tools/testing/selftests/kvm/aarch64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/aarch64/get-reg-list.c
@@ -100,16 +100,6 @@ static const char *config_name(struct vcpu_config *c)
 	return c->name;
 }
 
-static bool has_cap(struct vcpu_config *c, long capability)
-{
-	struct reg_sublist *s;
-
-	for_each_sublist(c, s)
-		if (s->capability == capability)
-			return true;
-	return false;
-}
-
 static bool filter_reg(__u64 reg)
 {
 	/*
@@ -287,10 +277,7 @@ static void print_reg(struct vcpu_config *c, __u64 id)
 		printf("\tKVM_REG_ARM_FW_FEAT_BMAP_REG(%lld),\n", id & 0xffff);
 		break;
 	case KVM_REG_ARM64_SVE:
-		if (has_cap(c, KVM_CAP_ARM_SVE))
-			printf("\t%s,\n", sve_id_to_str(c, id));
-		else
-			TEST_FAIL("%s: KVM_REG_ARM64_SVE is an unexpected coproc type in reg id: 0x%llx", config_name(c), id);
+		printf("\t%s,\n", sve_id_to_str(c, id));
 		break;
 	default:
 		TEST_FAIL("%s: Unexpected coproc type: 0x%llx in reg id: 0x%llx",
-- 
2.34.1


