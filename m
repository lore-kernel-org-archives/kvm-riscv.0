Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E7EC79F99
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYctfrKKQiskLKGxU42e3umr3TzQXaowPS1K/ssEvvQ=; b=WmtX5A82/I22BW
	vzai+aDnDDNUPWe4BspO2GrpO4LqMGIZ1THeybl0RYk+x9rrg8c4NbcQo1PlJavL/rqOr8Omx4jhl
	ZeTa9g4shEWXvyN3lJExTSXdBe9FYXu9ewmHBbQLpKBPvFPmIDB78+m7P9EFXZA4W8MP9CrRjhN1y
	BnTlY5QOl1OlmcxoACcwyZzTeBnUFf1UKTWqG4/ON/m/SyKO3ZUCMTnP52MzCWjOOIzQhXgET4MMB
	lVIr5tih90haGAOLSKRvjlKjsA0ITpWE6prJDiP9kooeqXjDKucx1lVdcmoa1O3K6co06qsyeh1jB
	5X3F32WqrohlxxVPck9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x427x-0000000A93A-2YrZ;
	Tue, 08 Sep 2026 20:09:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x427w-0000000A92v-0i7N;
	Tue, 08 Sep 2026 20:09:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FBF24192E;
	Tue,  8 Sep 2026 20:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B1C1F00A3D;
	Tue,  8 Sep 2026 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788898147;
	bh=wkAy/O15nPnQoj39O2Jkmru1wT+lgic9B+37FMixNf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LeCjzr7Lxvh1mK11clJatYArBKS24pOQj2ahoUiXsKc+TMcQ3s0bRMEPuPKe/H5cG
	 ZsEW/MtqSep77H7nCkm/77+CSVWcqJoxGZbLCWl5ASvegv3qYyEmX0y8XC6Y0141Uo
	 af6EjWwftHJuxPib7aF1l8vclmOnQgNieZ2HZiXZ30rDUhO/T0XypyMo2NiBJytLM4
	 vPOstzXzO+A/e9TtkCQ+tQ4x7dLeKigZgNz7/Tm6QuEugL9gtJG1veO65ATNV8fJQy
	 ELtXRPMisE79w3KzHtZleS+cd+UVh9zhKe52slLyVzGy5GWrN5w3yIDSpibI8kwAuV
	 +VL06VNS0fwRg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 08 Sep 2026 21:01:18 +0100
Subject: [PATCH 14/39] mm/vma: add vma[_flags]_is_kernel_owned() predicates
MIME-Version: 1.0
Message-Id: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-14-dacf19cce22b@kernel.org>
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
In-Reply-To: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-rdma@vger.kernel.org, selinux@vger.kernel.org, 
 linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
 fuse-devel@lists.linux.dev, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5413; i=ljs@kernel.org;
 h=from:subject:message-id; bh=JOTHkDDSySWU/FaBwU/dlcCoevcoCS8rHIuAzWMFwPs=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIWZG46/Dk21jE44vPvzcGS/6+X8j0O/utbrRvtXblW5
 8piq5c+HaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZiIcCPDXwExux8XPzA27F31
 bw0Tc6V9VTTb95yHxzZq+2xPZsnjNmBkuOonutzuk7tY0u2ujD8rmbM+7a/6VPJWsjn8WMXKbT1
 7OQE=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Rather than referring to VMA flags with uncertain meaning, add a new
predicate that explicitly describes what possession of the VMA_PFNMAP_BIT
or VMA_MIXEDMAP_BIT flags mean, and then refer to that function for
determining VMA mergeability.

Either flag means the contents of the mapping are owned by the kernel,
usually a driver, rather than by the core mm: the memory may be MMIO,
kernel-allocated pages or even ordinary pages the driver maps itself, but
the core must not populate, reclaim, migrate, copy-on-write or merge the
range on its own initiative.

We initially also include VMA_IO_BIT here, as by implication, these must be
kernel-owned. (mlock() also sets VMA_IO_BIT transiently on ordinary VMAs
while locking them, which is addressed later in this series.)

However the intent is to in future remove this, as no mapping should be
marked as an I/O mapping without also being marked with VMA_PFNMAP_BIT.

This forms the basis of further work intended to improve how we express VMA
properties such as this.

Also update the VMA userland tests to reflect the change.

No functional change intended.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 include/linux/mm.h              | 56 ++++++++++++++++++++++++++++++++++++++++-
 tools/testing/vma/include/dup.h | 29 ++++++++++++++++++++-
 2 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 4604cd011ca4..45c59474c853 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1612,6 +1612,44 @@ static inline bool vma_is_shared_maywrite(const struct vm_area_struct *vma)
 	return is_shared_maywrite(&vma->flags);
 }
 
+/**
+ * vma_flags_is_kernel_owned() - Do the specified VMA flags indicate that the
+ * contents of the VMA are owned by the kernel rather than the core mm?
+ * @flags: The VMA flags to test.
+ *
+ * A kernel-owned mapping is one whose contents are established and controlled
+ * by the kernel, typically a driver, rather than by the core mm's fault and
+ * rmap machinery.
+ *
+ * The mapping may be memory-mapped I/O, kernel-allocated pages or ordinary
+ * pages the owner has chosen to map itself (shmem via a PFN map, for instance).
+ *
+ * But in all cases core mm must not populate, reclaim, migrate, Copy-on-Write
+ * or merge it of its own accord.
+ *
+ * The pages mapped, if any, may or may not be reference counted or map counted.
+ *
+ * Returns: true if the flags indicate a kernel-owned mapping.
+ */
+static inline bool vma_flags_is_kernel_owned(const vma_flags_t *flags)
+{
+	return vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT,
+				  VMA_IO_BIT);
+}
+
+/**
+ * vma_is_kernel_owned() - Are the contents of @vma owned by the kernel?
+ * @vma: The VMA to test.
+ *
+ * See vma_flags_is_kernel_owned() for a description of this property.
+ *
+ * Returns: true if the VMA is kernel-owned.
+ */
+static inline bool vma_is_kernel_owned(const struct vm_area_struct *vma)
+{
+	return vma_flags_is_kernel_owned(&vma->flags);
+}
+
 /**
  * vma_flags_can_merge() - Do the specified VMA flags permit the VMA to be
  * merged with another?
@@ -1620,7 +1658,23 @@ static inline bool vma_is_shared_maywrite(const struct vm_area_struct *vma)
  */
 static inline bool vma_flags_can_merge(const vma_flags_t *flags)
 {
-	return !vma_flags_test_any_mask(flags, VMA_SPECIAL_FLAGS);
+	/*
+	 * VMA merging assumes that a VMA's flags and fields completely describe
+	 * its state.
+	 *
+	 * However, kernel-owned mappings may have established state upon mapping
+	 * not embodied in any attribute of the VMA.
+	 *
+	 * Additionally, private (CoW) PFN maps encode the source PFN of the
+	 * range in vma->vm_pgoff, which may otherwise cause spurious merges.
+	 */
+	if (vma_flags_is_kernel_owned(flags))
+		return false;
+	/* VMA explicitly marked as being unmergeable. */
+	if (vma_flags_test(flags, VMA_DONTEXPAND_BIT))
+		return false;
+
+	return true;
 }
 
 /**
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 52eee05e6c32..3fe40e0f4034 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -1659,7 +1659,34 @@ static inline bool file_is_dev_zero(const struct file *file)
 	return file && file->f_op == &zero_fops;
 }
 
+static inline bool vma_flags_is_kernel_owned(const vma_flags_t *flags)
+{
+	return vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT,
+				  VMA_IO_BIT);
+}
+
+static inline bool vma_is_kernel_owned(const struct vm_area_struct *vma)
+{
+	return vma_flags_is_kernel_owned(&vma->flags);
+}
+
 static inline bool vma_flags_can_merge(const vma_flags_t *flags)
 {
-	return !vma_flags_test_any_mask(flags, VMA_SPECIAL_FLAGS);
+	/*
+	 * VMA merging assumes that the properties of a VMA completely describe
+	 * the properties of that VMA.
+	 *
+	 * However, kernel-owned mappings may have established state upon mapping
+	 * not embodied in any attribute of the VMA.
+	 *
+	 * Additionally, PFN maps encode the source PFN of the range in
+	 * vma->vm_pgoff, which may otherwise cause spurious merges.
+	 */
+	if (vma_flags_is_kernel_owned(flags))
+		return false;
+	/* VMA explicitly marked as being unmergeable. */
+	if (vma_flags_test(flags, VMA_DONTEXPAND_BIT))
+		return false;
+
+	return true;
 }

-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
