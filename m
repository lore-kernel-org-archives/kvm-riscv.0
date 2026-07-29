Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10716C54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 07:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uJjnPExiQGOt5NXVhLXOMPR8V9vt1sNBduwd8sHi9iI=; b=psR1n02vZyRn1G
	qKLhxcl+Xfqr5tlbV9Prjd099XxCXYWeWA81TUL6FXTM0WR8Z9GE4z0fGfSs+pKrRVD0C6gALfOiF
	gIGyWlh47xxHRzJn6QUe04Bi6+Kp3ZY8Hl9BjFZnytSfOkO4fHfXQX9lFLSNTPiE4CQ/MpERONsQr
	o2lc5rCKw973U7RBzJm2i1QvIGNdXXx3KyHfT5O9xszmYgo1FmdYNlWb9gTML9QxH/2XxBsKXJIx9
	+EdHvz/3b5cYkwRfMhff19HnP9yyaYxdTsEVTb0Ie6D879Tkc8t0rSOiIGIYH1gFsHVv4Hi47eR/y
	MSg9WzOMl/ou8ymPx70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyOd-0000000759f-310a;
	Wed, 29 Jul 2026 07:08:07 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyOb-0000000758o-0RoL
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 07:08:06 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-38dcd98e5easo346500a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785308884; x=1785913684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X3JdpARdvO6SntweUzlxloeUTF3+X8KQZf2BNPxyxhE=;
        b=FamMNHlfHR7tf47O7TzuXNU0xf0t3faSHAzhEy2ym0Ffgr0JV0ZA35j32p1uB8TRBt
         fOMbyKUyeXj9xR4gv27Szrl8AXb5VgO5BJNY8w9zDwEOAoSURmHr0+9C15k4Jb/lgOle
         5ue3rqMwsOKArLvy7VmXX0dkWb8qcNw2UppQRqRx1g0BxlyK6PFwKCGjmVA80hxwdK56
         xj9KBeTTm3lr+4l7AAGiofC+NzxCtSjAw8ulkYNqDZyEqGJvWk/T/et2gg8czrS1Fg4s
         blk/+a+5ZfzJ6/nvRsRpCQSUF2b/WylH1O+N8Awv27/Kz9JOmHux9R2/oIlr+Y0PVF5O
         uvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785308884; x=1785913684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X3JdpARdvO6SntweUzlxloeUTF3+X8KQZf2BNPxyxhE=;
        b=rls26wMek3NYYFOva22McqiWRTN3b3qh1vi/KvhXwjNHOIv1P5uLtGtqWniTNCNhtm
         Q9zrZMokQL+SOEUNdKIDJnxTKQGELQjK8aL5jWHMJYlsWI6YaPhlSOMGX5QfYNXvNyGh
         gSaR0DJ+jNbW9Ua8PuL09FxJ+62Vo95cPj3JgtjYoHUz/lNqMKNwBEuc8Q0/t+/XwxAG
         9fUZhABw2l76ttV0PvWWtWGhQRJvvyFG2qmLJUzZjDlzBEHObbSY5qGm7LK10F/FlO30
         1k+5fn3k2Z7ACu1sCAwxFGc1Fk2RJoXqlsy4l7JQAKCWavZtJOnF4NDgQOKBWAbGn1Pv
         1WRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVZ6Hcotf5o2G0PGJVsdsWlU0eXHCj72SHNV2hXDiqFSOdYgAVhCufo8TccXi8Ky10POHQY2ixvgc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXRFXrkzRwwOrSJ6bk3cXppTLYTDyUjr/lVD/NHKqjdaarQJZ0
	W/rdbvYbs3I0EDGdNL/gCkdtV42qKEkhQFG0pKE9qYvSht2B5l8jPiEy
X-Gm-Gg: AR+sD10/pOfxJCpLQgidXPGYFZsOOcKQMVVCksFERggAIIV+aUXDJdbFVFBJzjRawEx
	gJUXd1/4lRdKWbeYvcT+GwQijNd/iFJOpgspst8NdhITX7lA2CEwf1oJ7uOi09RH051jILUaZI6
	3+E0NpV/ZPLPTpt9yK1liGwEsm6Rr8i39iCgS4RoT9hbjHh1mfOVd6a8/JvrKvVTViQI7E0bV+M
	alzAZNowtxTeRFf+Rs+15Im8wejHN2A/uM4UYfdNifCAf0biwHiMdix1BNpMI6DGYclAsGVv0m+
	jB9Dc6LmvJ4Lxl0VJkfP1X5cG+6qvWNQ0mU/yUo96CxnVBaWLO7M8fBcpwZxCbMHHdgkGoYIl9T
	dYJMJupvA+9gRGlU619cqK2wTpPBvVFKGeDwCKx4aD925iYQjRB0WYWt88TPNgal4EzNb8v1IlI
	tCKfBHtj7xN+doXmkmyIWUeTP3twvzsP3NSvwaopcXPCfodOz/QoyTVWyD8C8ZkLQG06Xnif2IF
	Jo=
X-Received: by 2002:a17:90b:3c12:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38f6a44b7a8mr6072575a91.14.1785308884161;
        Wed, 29 Jul 2026 00:08:04 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292af9sm873721a91.11.2026.07.29.00.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:08:03 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [RFC PATCH] RISC-V: KVM: Add minimal guest_memfd support
Date: Wed, 29 Jul 2026 15:07:56 +0800
Message-ID: <20260729070756.730312-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_000805_176851_ACEFAE8B 
X-CRM114-Status: GOOD (  12.49  )
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

Add minimal guest_memfd support for RISC-V KVM, following the same
pattern as x86 and arm64.

1. Select KVM_GUEST_MEMFD in Kconfig
2. In kvm_riscv_mmu_map(), check kvm_slot_has_gmem() early, before
   taking mmap_read_lock(). For gmem memslots, resolve the PFN via
   kvm_gmem_get_pfn(), then acquire kvm->mmu_lock and jump to G-stage
   mapping, bypassing vma_lookup()/__kvm_faultin_pfn(). The gmem PFN
   is resolved before mmap_read_lock() so the mmu_lock taken for the
   mapping is never held while waiting for mmap_lock, which would
   deadlock against mmu_notifier invalidation (mmu_lock -> mmap_lock).
3. Skip kvm_release_faultin_page() for gmem pages; their lifetime is
   managed by the gmem inode and invalidation notifiers.

Verified: defconfig + CONFIG_KVM_GUEST_MEMFD=y compiles cleanly.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/Kconfig |  1 +
 arch/riscv/kvm/mmu.c   | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..77121100579f 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,6 +29,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_GUEST_MEMFD
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d2a06a54be17..a9d61d0366e2 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -557,6 +557,19 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	/* Setup initial state of output mapping */
 	memset(out_map, 0, sizeof(*out_map));
 
+	if (kvm_slot_has_gmem(memslot)) {
+		int max_order;
+
+		ret = kvm_gmem_get_pfn(kvm, memslot, gfn, &hfn, &page, &max_order);
+		if (ret)
+			return ret;
+
+		vma_pagesize = PAGE_SIZE;
+		writable = true;
+		write_lock(&kvm->mmu_lock);
+		goto map_gstage;
+	}
+
 	if (is_write && logging &&
 	    kvm_riscv_mmu_dirty_log_write_fault_fast(kvm, memslot, gpa, out_map))
 		return 0;
@@ -643,6 +656,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (!logging && !is_hugetlb && vma_pagesize == PAGE_SIZE)
 		vma_pagesize = transparent_hugepage_adjust(kvm, memslot, hva, &hfn, &gpa);
 
+map_gstage:
 	if (writable) {
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
@@ -658,7 +672,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret, writable);
+	if (!kvm_slot_has_gmem(memslot))
+		kvm_release_faultin_page(kvm, page, ret, writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
