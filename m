Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D12606A31D
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2msg5zmh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=yMDR21xP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h0W+xXirahkZjd+bfmi6QOcgfRXlW7UA099ZF+VBjuk=; b=2msg5zmhhQWHqcosJYss4iu/XE
	EazqXTqvz3BiYzuJ5j7eDYAFgnFS1lm9ZallqbeDdWu501a1BnxexbVrmawqpI7hClZZ9HXSTzFA2
	2s732MTeiRgFK/XRizxOM5w83mekKdW00E6VjDUWiV2WDC/ekZIj4fYcBXwcG1cK1LJdcuhg4Wxef
	qmmhsQK7mCijxT2fV7GVvadIWlfpI8UcA5/kjQmoGRFxmvRk8uylJXjJYerMA2UnKps+aLJKnVu5t
	wFeWLyBPoA3dZ+ELGoy4XuWBDdQuqdwXQrAHgRve8MswUZH3wfKiu2CgCUfa2WNgXdqQ7DAHXppch
	3rODJo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMroa-0000000CRWw-14Cs;
	Fri, 30 Oct 2026 18:59:00 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMroX-0000000CRWN-0uyW;
	Fri, 30 Oct 2026 18:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793386730; bh=mw96Q007DUPAQeKT8Ptwo3yABVaVeFnZ+TFfC0JmVJ8=;
	h=From:To:Cc:Subject:Date;
	b=yMDR21xPnfephXqAxRXDTKMF0f3O1t4bQN2gVuUDIo6viJU566JwQSPmE/pncAFwa
	 SvgRZpbWDZXmn3O/e5IRmD60yrM3kaJ8DIW3eZeThfz0158r+nMwfx+nx8vEq3ofLf
	 TzApOeLWcJC3rppCMCxe8TsQa6W3+9K8NAuxG8oA=
Received: from cyy-pc.lan ([240e:37c:221f:3500:33ac:ff07:4262:aa6f])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id EAC2CE97; Sat, 31 Oct 2026 02:58:44 +0800
X-QQ-mid: xmsmtpt1793386724t5a8cffea
Message-ID: <tencent_C8B170AF63DC42F81A47F9EA044BB4B11C09@qq.com>
X-QQ-XMAILINFO: MDJWyUmJdVqKyq6UzhUWUXe+4k6nld/Qa5hXvirgeodHiPQTqx5ZGiPGbDNjZX
	 4qgBqJX7f5EYtOIGRcELlt5Hu7bZsdvzNlHnZi/R9D0bt8PMemZzy67lQIoYR8QQwNclLy4UbYLv
	 4jU6O+u/VH0cvmaBHCZe8eBAjqjd2x49hPuLybfqomJq7EEaCIxShYmBj0q+oL5svh8QUmbDvKPT
	 nCvSLFhLySRNnDW4EFHt0b/z+ewKh/1/dN3UpDzI4EMSIIpaB1vXGOV0lf29SuN2z9VNyxGk9d9e
	 pFLmJM2W9S1BwVoT9VWOGgKI8czYvBkXH8lie1HnO4NMunCByORRYn/tuslVApvIiXXO5CEKn2W9
	 F28keu9gS1gEKEODEH1d/fkqeD6SLBofCPpTZRKyje4vqClWdi2UO0S6wxpVW36o06hKrXla2FyE
	 lydfhHbkztV5R0hUYJdDunm8Q7Eqyv5/ahZhzAZmh/gqxXMBlWYDJcNUHIhUsE4dMg3mbJLgLKuO
	 JaY9YaTX/AMcsmrJRG7DacKsHQuSuJsQAq3gc5iJD7WWRB/PwDXNgrIyGbFeVrUPSdcAI9536qHl
	 vJeCSNqIuWT9sDZVmdtONJj8WfAjz1WTHtpwJs8BVS0mqUfnAx6N73wJTUoKc2kmCaJNpXqejTXs
	 j/uAtOTRr8Ve+/X+kAu+TofzdTeSsKi9ynS3rlyw1f49eT4Z5smOxqVzTJWqa9nJwj7GshoWCHnl
	 YyjRp8MDgTZNgz5kcWETZgpQS7ycJZ4oI3BiXgYdNF7pctMl1bP0ti3CK4WvlIrjuGBwIfXB5VZB
	 dZphAlVex5klG+9gNA3rdAmyvVlZ20WzwsYocIM84gBvTsvod/viMgjWJyDrQmUriEN87IdVNWrS
	 ltOB2ifHzWtCXzn8q94zbrgLejWikVtOEcQ2QXES/KSVC9yF3tl8qY91cSqHgD2xqqLhv4xds6Xa
	 4PbxkxsOFACNC3Vz0y0a2KwxQaQlnzJOlQ01bTMC7x+RqiHaSNzeXG6L5/IUL53OiRwjtrzHPPqk
	 9ndeif1q2Y1zdx8Fx9r0xAt9AIL0N3/AicUjVU4Q4g8fPVwRdvloiJX3ro9xwlLhjV0DJEsBAwqv
	 8+8P9zqo5zfLEBCAUJBlfNSFvTzg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-USESPAMBG: true
From: Yangyu Chen <cyy@cyyself.name>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	stable@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Fix G-stage page table memory leak on VM destroy
Date: Sat, 31 Oct 2026 02:58:36 +0800
X-OQ-MSGID: <20261030185836.4018167-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_115857_594848_8BE9EFC8 
X-CRM114-Status: GOOD (  21.71  )
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kvm_riscv_mmu_free_pgd() tears down the G-stage with
kvm_riscv_gstage_unmap_range() over the whole guest physical address
space. That function looks up each address with
kvm_riscv_gstage_get_leaf(), which walks down to the leaf PTE, and then
clears only that leaf. kvm_riscv_gstage_op_pte() frees a page table only
when it is called on a non-leaf PTE, which never happens here, so every
page table below the PGD is leaked when a VM is destroyed. With 4 KiB
mappings this is one page per 2 MiB of guest memory that was ever
mapped, plus the upper-level tables.

The leaked pages are not slab, vmalloc or page cache, so they show up
only as unaccounted used memory. On a SpacemiT K3 host, a workload that
creates and destroys tens of thousands of small VMs leaked 0.5-1 MiB per
VM and ran the host out of memory after about 20,000 VMs.

Add kvm_riscv_gstage_unmap_all(), which calls kvm_riscv_gstage_op_pte()
with GSTAGE_OP_CLEAR on every PGD entry. That recursively clears all
leaf PTEs and frees each page table below the PGD. Use it in
kvm_riscv_mmu_free_pgd().

Tested with a reproducer script that builds a minimal KVM host kernel
from a source tree and boots it under QEMU 11.0.2 (TCG, rv64 with H,
Sv57x4 G-stage). Its init creates 10 VMs one after another. Each guest
writes one word in every 2 MiB of an 8 GiB RAM region (anonymous memory
with MADV_NOHUGEPAGE, so 4 KiB G-stage mappings) and then shuts down,
so each VM needs 4096 last-level page tables (16 MiB). MemFree lost per
VM, after one warm-up VM:

  before:  16415 kB  (RESULT: LEAK)
  after:    1636 kB  (RESULT: OK, noise)

The bug was found while investigating the host OOM, and the fix and
reproducer were written with the help of an AI coding assistant
(Claude). The analysis, fix and test results above were reviewed by
the submitter.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Cc: stable@vger.kernel.org
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
How to reproduce:

The reproducer script is at
https://gist.github.com/cyyself/23abb87a8ad9ee8c64ce03cca78669fc
and needs riscv64-linux-gnu-gcc, qemu-system-riscv64 and cpio. Run it
from the top of a kernel source tree:

	$ cd linux
	$ /path/to/kvm-riscv-gstage-leak.sh

It builds a minimal riscv64 KVM host kernel (allnoconfig + KVM) into
.kvm-leak-build/ and boots it under QEMU (TCG, -cpu rv64,h=true) with a
static test program as /init. The test creates 10 VMs one after another.
Each guest touches one page in every 2 MiB of 8 GiB of guest RAM, so it
needs 16 MiB of last-level G-stage page tables. The test then prints how
much MemFree each VM leaves behind. The first run takes about 1.5
minutes, mostly kernel build; reruns take about 10 seconds.

Without this patch:

	10 VMs, each touching one 4 KiB page per 2 MiB of 8 GiB guest RAM
	MemFree 2037664 -> 1873512 kB: 16415 kB lost per VM (a leaking kernel loses ~16384 kB)
	RESULT: LEAK

With this patch:

	MemFree 2054080 -> 2037716 kB: 1636 kB lost per VM (a leaking kernel loses ~16384 kB)
	RESULT: OK

The exit status is 0 for OK, 1 for LEAK and 2 if the test could not
run. IMAGE=<path/to/Image> boots an existing kernel instead of building
one. That kernel needs CONFIG_KVM=y, CONFIG_BLK_DEV_INITRD=y and
CONFIG_DEVTMPFS=y.

I also tested VMs that select Sv39x4, Sv48x4 and Sv57x4 through
KVM_CAP_VM_GPA_BITS, and four VMs with mixed modes alive at the same
time, destroyed one by one while the remaining VMs kept running and
were checked for correct guest memory contents. With this patch, no
memory was lost in any mode and no guest data was corrupted. Without
it, every mode leaked about 16 MiB per VM.
---
 arch/riscv/include/asm/kvm_gstage.h |  2 ++
 arch/riscv/kvm/gstage.c             | 22 ++++++++++++++++++++++
 arch/riscv/kvm/mmu.c                |  3 +--
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index aaf080ba1b77..90ec9e0b34b1 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -80,6 +80,8 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 				  gpa_t start, gpa_t size, bool may_block);
 
+bool kvm_riscv_gstage_unmap_all(struct kvm_gstage *gstage);
+
 bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end);
 
 bool kvm_riscv_gstage_wp_pt_masked(struct kvm_gstage *gstage, gfn_t base_gfn,
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index e5002cb9cbef..c912cdc2021f 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -456,6 +456,28 @@ bool kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 	return flush;
 }
 
+/*
+ * Clear every G-stage mapping and free all page tables below the PGD.
+ * kvm_riscv_gstage_unmap_range() only clears leaf PTEs and leaves the
+ * page tables in place, so it cannot be used to tear down a G-stage.
+ */
+bool kvm_riscv_gstage_unmap_all(struct kvm_gstage *gstage)
+{
+	u32 level = gstage->pgd_levels - 1;
+	pte_t *pgd = (pte_t *)gstage->pgd;
+	unsigned long i, page_size;
+	bool flush = false;
+
+	if (gstage_level_to_page_size(gstage, level, &page_size))
+		return false;
+
+	for (i = 0; i < kvm_riscv_gstage_pgd_size / sizeof(pte_t); i++)
+		flush |= kvm_riscv_gstage_op_pte(gstage, i * page_size, &pgd[i],
+						 level, GSTAGE_OP_CLEAR);
+
+	return flush;
+}
+
 bool kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end)
 {
 	int ret;
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 371fccaf9df0..87838a0f6bb9 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -784,8 +784,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 	write_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
 		kvm_riscv_gstage_init(&gstage, kvm);
-		flush = kvm_riscv_gstage_unmap_range(&gstage, 0UL,
-			kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), false);
+		flush = kvm_riscv_gstage_unmap_all(&gstage);
 		pgd = READ_ONCE(kvm->arch.pgd);
 		kvm->arch.pgd = NULL;
 		kvm->arch.pgd_phys = 0;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
