Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E45CCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 03:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:References
	:In-Reply-To:Date:Message-Id:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVeFTK2eBqVHKeuR/eeRONaw4AEjoCbow7d7o4rP+lQ=; b=aYE+Pd270+7/so
	4bRghTB4SvagvBEjEe+tblUs+z9yvtA6D/35h73KujaqvPxXRjLcrCRRmT17JY+At7s0qJp13dzcW
	jezyf9C13NXIvWjG5lVpVxZaRVI7gQ+tVrvlT9E4KxAdz/w5q0ldGuPMgMoam9rd3zbTmlOAvwM/1
	hjl8oTd6yPmPN613EJ/cLPSMa8+yBb6p7+FLs01bRfYRaQtJHwPm4CXny8bWPVm4bAt0mE+Wlo/Ya
	0uaAIbpuhamD4z5EQtir+kv5wQxvbT/yUFyQXKYicmkj+W9+Bqwa65oK6qz/CJ/ygvtZnLYJprDwg
	vL4C6OYDEO2PdQi3XNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9bEM-00000006SxZ-3TKf;
	Fri, 17 Oct 2025 03:34:14 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9bEJ-00000006Sx8-2VVR
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 03:34:13 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4cnr5p742Pz4xNtM;
	Fri, 17 Oct 2025 11:34:06 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 59H3Y7fB074149;
	Fri, 17 Oct 2025 11:34:07 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202510170334.59H3Y7fB074149@mse-fl2.zte.com.cn>
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl2.zte.com.cn with SMTP id 59H3DVYI046522;
	Fri, 17 Oct 2025 11:13:32 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 17 Oct 2025 11:13:33 +0800 (CST)
Date: Fri, 17 Oct 2025 11:13:33 +0800 (CST)
X-Zmail-TransId: 2afb68f1b45df50-5f339
X-Mailer: Zmail v1.0
In-Reply-To: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
References: 20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <kvm-riscv@lists.infradead.org>, <ajones@ventanamicro.com>
Subject: =?UTF-8?B?W1BBVENIIDEvMl0gS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgcmlzY3Ygdm0gc2F0cCBtb2Rlcw==?=
X-MAIL: mse-fl2.zte.com.cn 59H3Y7fB074149
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Fri, 17 Oct 2025 11:34:07 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68F1B92E.002/4cnr5p742Pz4xNtM
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_203411_947049_800F7151 
X-CRM114-Status: GOOD (  10.51  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Current vm modes cannot represent riscv guest modes precisely, here add
P41V39, P50V48 and P56V57.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  7 ++++++-
 tools/testing/selftests/kvm/lib/guest_modes.c |  7 +++----
 tools/testing/selftests/kvm/lib/kvm_util.c    | 15 +++++++++++++
 .../selftests/kvm/lib/riscv/processor.c       | 21 +++++++++++++++----
 4 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index bee65ca08721..02224bc514d4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -179,6 +179,11 @@ enum vm_guest_mode {
        VM_MODE_P36V48_64K,
        VM_MODE_P47V47_16K,
        VM_MODE_P36V47_16K,
+
+       VM_MODE_P56V57_4K,      /* For riscv64 */
+       VM_MODE_P50V48_4K,
+       VM_MODE_P41V39_4K,
+
        NUM_VM_MODES,
 };

@@ -229,7 +234,7 @@ extern enum vm_guest_mode vm_mode_default;
 #error "RISC-V 32-bit kvm selftests not supported"
 #endif

-#define VM_MODE_DEFAULT                        VM_MODE_P40V48_4K
+#define VM_MODE_DEFAULT                        VM_MODE_P50V48_4K
 #define MIN_PAGE_SHIFT                 12U
 #define ptes_per_page(page_size)       ((page_size) / 8)

diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
index b04901e55138..63d0d5479188 100644
--- a/tools/testing/selftests/kvm/lib/guest_modes.c
+++ b/tools/testing/selftests/kvm/lib/guest_modes.c
@@ -75,10 +75,9 @@ void guest_modes_append_default(void)
        {
                unsigned int sz = kvm_check_cap(KVM_CAP_VM_GPA_BITS);

-               if (sz >= 52)
-                       guest_mode_append(VM_MODE_P52V48_4K, true);
-               if (sz >= 48)
-                       guest_mode_append(VM_MODE_P48V48_4K, true);
+               guest_mode_append(VM_MODE_P56V57_4K, sz >= 59);
+               guest_mode_append(VM_MODE_P50V48_4K, sz >= 50);
+               guest_mode_append(VM_MODE_P41V39_4K, sz >= 41);
        }
 #endif
 }
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a055343a7bf7..4cd69fffa06d 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -224,6 +224,9 @@ const char *vm_guest_mode_string(uint32_t i)
                [VM_MODE_P36V48_64K]    = "PA-bits:36,  VA-bits:48, 64K pages",
                [VM_MODE_P47V47_16K]    = "PA-bits:47,  VA-bits:47, 16K pages",
                [VM_MODE_P36V47_16K]    = "PA-bits:36,  VA-bits:47, 16K pages",
+               [VM_MODE_P56V57_4K]     = "PA-bits:56,  VA-bits:57,  4K pages",
+               [VM_MODE_P50V48_4K]     = "PA-bits:50,  VA-bits:48,  4K pages",
+               [VM_MODE_P41V39_4K]     = "PA-bits:41,  VA-bits:39,  4K pages",
        };
        _Static_assert(sizeof(strings)/sizeof(char *) == NUM_VM_MODES,
                       "Missing new mode strings?");
@@ -251,6 +254,9 @@ const struct vm_guest_mode_params vm_guest_mode_params[] = {
        [VM_MODE_P36V48_64K]    = { 36, 48, 0x10000, 16 },
        [VM_MODE_P47V47_16K]    = { 47, 47,  0x4000, 14 },
        [VM_MODE_P36V47_16K]    = { 36, 47,  0x4000, 14 },
+       [VM_MODE_P56V57_4K]     = { 56, 57,  0x1000, 12 },
+       [VM_MODE_P50V48_4K]     = { 50, 48,  0x1000, 12 },
+       [VM_MODE_P41V39_4K]     = { 41, 39,  0x1000, 12 },
 };
 _Static_assert(sizeof(vm_guest_mode_params)/sizeof(struct vm_guest_mode_params) == NUM_VM_MODES,
               "Missing new mode params?");
@@ -351,6 +357,15 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
        case VM_MODE_P44V64_4K:
                vm->pgtable_levels = 5;
                break;
+       case VM_MODE_P56V57_4K:
+               vm->pgtable_levels = 5;
+               break;
+       case VM_MODE_P50V48_4K:
+               vm->pgtable_levels = 4;
+               break;
+       case VM_MODE_P41V39_4K:
+               vm->pgtable_levels = 3;
+               break;
        default:
                TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);
        }
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 2eac7d4b59e9..de84c092f982 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -197,22 +197,35 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 {
        struct kvm_vm *vm = vcpu->vm;
        unsigned long satp;
+       unsigned long satp_mode;
+       unsigned long max_satp_mode;

        /*
         * The RISC-V Sv48 MMU mode supports 56-bit physical address
         * for 48-bit virtual address with 4KB last level page size.
         */
        switch (vm->mode) {
-       case VM_MODE_P52V48_4K:
-       case VM_MODE_P48V48_4K:
-       case VM_MODE_P40V48_4K:
+       case VM_MODE_P56V57_4K:
+               satp_mode = SATP_MODE_57;
+               break;
+       case VM_MODE_P50V48_4K:
+               satp_mode = SATP_MODE_48;
+               break;
+       case VM_MODE_P41V39_4K:
+               satp_mode = SATP_MODE_39;
                break;
        default:
                TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
        }

+       max_satp_mode = vcpu_get_reg(vcpu, RISCV_CONFIG_REG(satp_mode));
+
+       if ((satp_mode >> SATP_MODE_SHIFT) > max_satp_mode)
+               TEST_FAIL("Unable to set satp mode 0x%lx, max mode 0x%lx\n",
+                         satp_mode >> SATP_MODE_SHIFT, max_satp_mode);
+
        satp = (vm->pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
-       satp |= SATP_MODE_48;
+       satp |= satp_mode;

        vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(satp), satp);
 }
--
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
