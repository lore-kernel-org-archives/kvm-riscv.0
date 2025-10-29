Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A868FCCF9EB
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GJHStodMlrE1PPXDV4IB4TTRiCvazMw8JixU+7T70/Y=; b=ed7l24NUUPxRSe
	JyjbEV2K71cQf1Wi2izn96bUMB7z1t6ynwM4mA6PVhTXsOvd80bumpTZEzsf4TZ1bLPSu1nDckt+8
	O/brgnW3hC4zF/fE/x5erFuFhT9eZjY1rUUmkZGxt0XgK9GWE7Omaro1LNJlbj/96968hs+8dc7W1
	gKR3HPAPAB3WlOmoVUDWM25c3VIKCDzXkd4IFOUHYpj0ZQiFPuicgUDCdCMXZWGgFEs6QKTE8v3bD
	fuAepEWXLwocKe9gKHoRqXC5Io7b4+LH89VZjKxnn18VFeZ+LaKX8sEFw91u0u0TUckvqzvH0FRj4
	YjQvMTIu/E2F55La1nxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Wi-000000011YI-1HhM;
	Wed, 29 Oct 2025 11:39:40 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4We-000000011WK-2kvx
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:39:38 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4cxQJD0qQNz59vCT;
	Wed, 29 Oct 2025 19:39:24 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 59TBdMIU031588;
	Wed, 29 Oct 2025 19:39:22 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202510291139.59TBdMIU031588@mse-fl2.zte.com.cn>
Received: from njy2app08.zte.com.cn ([10.40.13.206])
	by mse-fl2.zte.com.cn with SMTP id 59TBK5T8016854;
	Wed, 29 Oct 2025 19:20:05 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 29 Oct 2025 19:20:08 +0800 (CST)
Date: Wed, 29 Oct 2025 19:20:08 +0800 (CST)
X-Zmail-TransId: 2aff6901f8688af-3dd04
X-Mailer: Zmail v1.0
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <kvm-riscv@lists.infradead.org>, <ajones@ventanamicro.com>,
        <rkrcmar@ventanamicro.com>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCByaXNjdiB2bSBzYXRwIG1vZGVzwqA=?=
X-MAIL: mse-fl2.zte.com.cn 59TBdMIU031588
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 29 Oct 2025 19:39:24 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6901FCEC.000/4cxQJD0qQNz59vCT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_043937_039793_EA004A98 
X-CRM114-Status: GOOD (  17.67  )
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
all 9 combinations of P(56,40,41) x V(57,48,39). Also the default vm
mode is detected on runtime instead of hardcoded one, which might not be
supported on specific machine.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 17 ++++-
 .../selftests/kvm/include/riscv/processor.h   |  2 +
 tools/testing/selftests/kvm/lib/guest_modes.c | 41 +++++++++---
 tools/testing/selftests/kvm/lib/kvm_util.c    | 33 ++++++++++
 .../selftests/kvm/lib/riscv/processor.c       | 63 +++++++++++++++++--
 5 files changed, 142 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index bee65ca08721..2055f0f5df82 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -179,6 +179,17 @@ enum vm_guest_mode {
        VM_MODE_P36V48_64K,
        VM_MODE_P47V47_16K,
        VM_MODE_P36V47_16K,
+
+       VM_MODE_P56V57_4K,      /* For riscv64 */
+       VM_MODE_P56V48_4K,
+       VM_MODE_P56V39_4K,
+       VM_MODE_P50V57_4K,
+       VM_MODE_P50V48_4K,
+       VM_MODE_P50V39_4K,
+       VM_MODE_P41V57_4K,
+       VM_MODE_P41V48_4K,
+       VM_MODE_P41V39_4K,
+
        NUM_VM_MODES,
 };

@@ -203,10 +214,10 @@ kvm_static_assert(sizeof(struct vm_shape) == sizeof(uint64_t));
        shape;                                  \
 })

-#if defined(__aarch64__)
-
 extern enum vm_guest_mode vm_mode_default;

+#if defined(__aarch64__)
+
 #define VM_MODE_DEFAULT                        vm_mode_default
 #define MIN_PAGE_SHIFT                 12U
 #define ptes_per_page(page_size)       ((page_size) / 8)
@@ -229,7 +240,7 @@ extern enum vm_guest_mode vm_mode_default;
 #error "RISC-V 32-bit kvm selftests not supported"
 #endif

-#define VM_MODE_DEFAULT                        VM_MODE_P40V48_4K
+#define VM_MODE_DEFAULT                        vm_mode_default
 #define MIN_PAGE_SHIFT                 12U
 #define ptes_per_page(page_size)       ((page_size) / 8)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 162f303d9daa..2d5a5548e698 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -191,4 +191,6 @@ static inline void local_irq_disable(void)
        csr_clear(CSR_SSTATUS, SR_SIE);
 }

+unsigned long riscv64_get_satp_mode(void);
+
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
index b04901e55138..ce3099630397 100644
--- a/tools/testing/selftests/kvm/lib/guest_modes.c
+++ b/tools/testing/selftests/kvm/lib/guest_modes.c
@@ -4,7 +4,7 @@
  */
 #include "guest_modes.h"

-#ifdef __aarch64__
+#if defined(__aarch64__) || defined(__riscv)
 #include "processor.h"
 enum vm_guest_mode vm_mode_default;
 #endif
@@ -13,9 +13,11 @@ struct guest_mode guest_modes[NUM_VM_MODES];

 void guest_modes_append_default(void)
 {
-#ifndef __aarch64__
+#if !defined(__aarch64__) && !defined(__riscv)
        guest_mode_append(VM_MODE_DEFAULT, true);
-#else
+#endif
+
+#ifdef __aarch64__
        {
                unsigned int limit = kvm_check_cap(KVM_CAP_ARM_VM_IPA_SIZE);
                uint32_t ipa4k, ipa16k, ipa64k;
@@ -74,11 +76,36 @@ void guest_modes_append_default(void)
 #ifdef __riscv
        {
                unsigned int sz = kvm_check_cap(KVM_CAP_VM_GPA_BITS);
+               unsigned long satp_mode = riscv64_get_satp_mode() << SATP_MODE_SHIFT;
+               int i;

-               if (sz >= 52)
-                       guest_mode_append(VM_MODE_P52V48_4K, true);
-               if (sz >= 48)
-                       guest_mode_append(VM_MODE_P48V48_4K, true);
+               switch (sz) {
+               case 59:
+                       guest_mode_append(VM_MODE_P56V57_4K, satp_mode >= SATP_MODE_57);
+                       guest_mode_append(VM_MODE_P56V48_4K, satp_mode >= SATP_MODE_48);
+                       guest_mode_append(VM_MODE_P56V39_4K, satp_mode >= SATP_MODE_39);
+                       break;
+               case 50:
+                       guest_mode_append(VM_MODE_P50V57_4K, satp_mode >= SATP_MODE_57);
+                       guest_mode_append(VM_MODE_P50V48_4K, satp_mode >= SATP_MODE_48);
+                       guest_mode_append(VM_MODE_P50V39_4K, satp_mode >= SATP_MODE_39);
+                       break;
+               case 41:
+                       guest_mode_append(VM_MODE_P41V57_4K, satp_mode >= SATP_MODE_57);
+                       guest_mode_append(VM_MODE_P41V48_4K, satp_mode >= SATP_MODE_48);
+                       guest_mode_append(VM_MODE_P41V39_4K, satp_mode >= SATP_MODE_39);
+                       break;
+               default:
+                       break;
+               }
+
+               /* set the first supported mode as default */
+               vm_mode_default = NUM_VM_MODES;
+               for (i = 0; vm_mode_default == NUM_VM_MODES && i < NUM_VM_MODES; i++) {
+                       if (guest_modes[i].supported && guest_modes[i].enabled)
+                               vm_mode_default = i;
+               }
+               TEST_ASSERT(vm_mode_default != NUM_VM_MODES, "No supported mode!");
        }
 #endif
 }
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index a055343a7bf7..9803e61ae7db 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -224,6 +224,15 @@ const char *vm_guest_mode_string(uint32_t i)
                [VM_MODE_P36V48_64K]    = "PA-bits:36,  VA-bits:48, 64K pages",
                [VM_MODE_P47V47_16K]    = "PA-bits:47,  VA-bits:47, 16K pages",
                [VM_MODE_P36V47_16K]    = "PA-bits:36,  VA-bits:47, 16K pages",
+               [VM_MODE_P56V57_4K]     = "PA-bits:56,  VA-bits:57,  4K pages",
+               [VM_MODE_P56V48_4K]     = "PA-bits:56,  VA-bits:48,  4K pages",
+               [VM_MODE_P56V39_4K]     = "PA-bits:56,  VA-bits:39,  4K pages",
+               [VM_MODE_P50V57_4K]     = "PA-bits:50,  VA-bits:57,  4K pages",
+               [VM_MODE_P50V48_4K]     = "PA-bits:50,  VA-bits:48,  4K pages",
+               [VM_MODE_P50V39_4K]     = "PA-bits:50,  VA-bits:39,  4K pages",
+               [VM_MODE_P41V57_4K]     = "PA-bits:41,  VA-bits:57,  4K pages",
+               [VM_MODE_P41V48_4K]     = "PA-bits:41,  VA-bits:48,  4K pages",
+               [VM_MODE_P41V39_4K]     = "PA-bits:41,  VA-bits:39,  4K pages",
        };
        _Static_assert(sizeof(strings)/sizeof(char *) == NUM_VM_MODES,
                       "Missing new mode strings?");
@@ -251,6 +260,15 @@ const struct vm_guest_mode_params vm_guest_mode_params[] = {
        [VM_MODE_P36V48_64K]    = { 36, 48, 0x10000, 16 },
        [VM_MODE_P47V47_16K]    = { 47, 47,  0x4000, 14 },
        [VM_MODE_P36V47_16K]    = { 36, 47,  0x4000, 14 },
+       [VM_MODE_P56V57_4K]     = { 56, 57,  0x1000, 12 },
+       [VM_MODE_P56V48_4K]     = { 56, 48,  0x1000, 12 },
+       [VM_MODE_P56V39_4K]     = { 56, 39,  0x1000, 12 },
+       [VM_MODE_P50V57_4K]     = { 50, 57,  0x1000, 12 },
+       [VM_MODE_P50V48_4K]     = { 50, 48,  0x1000, 12 },
+       [VM_MODE_P50V39_4K]     = { 50, 39,  0x1000, 12 },
+       [VM_MODE_P41V57_4K]     = { 41, 57,  0x1000, 12 },
+       [VM_MODE_P41V48_4K]     = { 41, 48,  0x1000, 12 },
+       [VM_MODE_P41V39_4K]     = { 41, 39,  0x1000, 12 },
 };
 _Static_assert(sizeof(vm_guest_mode_params)/sizeof(struct vm_guest_mode_params) == NUM_VM_MODES,
               "Missing new mode params?");
@@ -351,6 +369,21 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
        case VM_MODE_P44V64_4K:
                vm->pgtable_levels = 5;
                break;
+       case VM_MODE_P56V57_4K:
+       case VM_MODE_P50V57_4K:
+       case VM_MODE_P41V57_4K:
+               vm->pgtable_levels = 5;
+               break;
+       case VM_MODE_P56V48_4K:
+       case VM_MODE_P50V48_4K:
+       case VM_MODE_P41V48_4K:
+               vm->pgtable_levels = 4;
+               break;
+       case VM_MODE_P56V39_4K:
+       case VM_MODE_P50V39_4K:
+       case VM_MODE_P41V39_4K:
+               vm->pgtable_levels = 3;
+               break;
        default:
                TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);
        }
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 2eac7d4b59e9..53675292b8eb 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -8,6 +8,7 @@
 #include <linux/compiler.h>
 #include <assert.h>

+#include "guest_modes.h"
 #include "kvm_util.h"
 #include "processor.h"
 #include "ucall_common.h"
@@ -197,22 +198,41 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
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
+       case VM_MODE_P50V57_4K:
+       case VM_MODE_P41V57_4K:
+               satp_mode = SATP_MODE_57;
+               break;
+       case VM_MODE_P56V48_4K:
+       case VM_MODE_P50V48_4K:
+       case VM_MODE_P41V48_4K:
+               satp_mode = SATP_MODE_48;
+               break;
+       case VM_MODE_P56V39_4K:
+       case VM_MODE_P50V39_4K:
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
@@ -515,3 +535,38 @@ unsigned long get_host_sbi_spec_version(void)

        return ret.value;
 }
+
+void kvm_selftest_arch_init(void)
+{
+       /*
+        * riscv64 doesn't have a true default mode, so start by detecting the
+        * supported vm mode.
+        */
+       guest_modes_append_default();
+}
+
+unsigned long riscv64_get_satp_mode(void)
+{
+       int kvm_fd, vm_fd, vcpu_fd, err;
+       uint64_t val;
+       struct kvm_one_reg reg = {
+               .id     = RISCV_CONFIG_REG(satp_mode),
+               .addr   = (uint64_t)&val,
+       };
+
+       kvm_fd = open_kvm_dev_path_or_exit();
+       vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
+       TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
+
+       vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
+       TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
+
+       err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
+       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, vcpu_fd));
+
+       close(vcpu_fd);
+       close(vm_fd);
+       close(kvm_fd);
+
+       return val;
+}
--
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
